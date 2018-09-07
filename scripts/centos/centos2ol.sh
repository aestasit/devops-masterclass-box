#!/bin/sh

# Script to switch CentOS (or other similar distribution) to the
# Oracle Linux yum repository.
#
# If you have any questions or need any assistance with this script,
# please contact ksplice-support_ww@oracle.com
#
# Copyright 2016 Oracle
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -e
unset CDPATH

yum_url=http://yum.oracle.com
contact_email=ksplice-support_ww@oracle.com
bad_packages="centos-release-cr libreport-plugin-rhtsupport yum-rhn-plugin desktop-backgrounds-basic centos-logos libreport-centos libreport-plugin-mantisbt sl-logos"

usage() {
    echo "Usage: ${0##*/} [OPTIONS]"
    echo
    echo "OPTIONS"
    echo "-h"
    echo "        Display this help and exit"
    exit 1
} >&2

have_program() {
    hash "$1" >/dev/null 2>&1
}

dep_check() {
    if ! have_program "$1"; then
        exit_message "'${1}' command not found. Please install or add it to your PATH and try again."
    fi
}

exit_message() {
    echo "$1"
    echo "For assistance, please email <${contact_email}>."
    exit 1
} >&2

restore_repos() {
    yum remove -y $new_releases
    find . -name 'repo.*' | while read repo; do
        destination=`head -n1 "$repo"`
        if [ "$destination" ]; then
            tail -n+2 "$repo" > "$destination"
        fi
    done
    rm "${reposdir}/${repo_file}"
    exit_message "Could not install Oracle Linux packages.
Your repositories have been restored to your previous configuration."
}

## Start of script

while getopts "h" option; do
    case "$option" in
        h) usage ;;
        *) usage ;;
    esac
done

if [ `id -u` -ne 0 ]; then
    exit_message "You must run this script as root.
Try running 'su -c ${0}'."
fi

echo "Checking for required packages..."
for pkg in rpm yum python2 curl; do
    dep_check "$pkg"
done

echo "Checking your distribution..."
if ! old_release=`rpm -q --whatprovides redhat-release`; then
    exit_message "You appear to be running an unsupported distribution."
fi

if [ `echo "$old_release" | wc -l` -ne 1 ]; then
    exit_message "Could not determine your distribution because multiple
packages are providing redhat-release:
$old_release
"
fi

case "$old_release" in
    redhat-release*) ;;
    centos-release*) ;;
    sl-release*) ;;
    oraclelinux-release*|enterprise-release*)
        exit_message "You appear to be already running Oracle Linux."
        ;;
    *) exit_message "You appear to be running an unsupported distribution." ;;
esac

rhel_version=`rpm -q "$old_release" --qf "%{version}"`
base_packages='basesystem initscripts oracle-logos'
case "$rhel_version" in
    7*)
        repo_file=public-yum-ol7.repo
        repo_name=ol7_latest
        new_releases="oraclelinux-release redhat-release-server"
        base_packages="$base_packages plymouth grub2 grubby"
        ;;
    6*)
        repo_file=public-yum-ol6.repo
        repo_name=ol6_latest
        new_releases="oraclelinux-release redhat-release-server"
        base_packages="$base_packages oraclelinux-release-notes plymouth grub grubby"
        ;;
    5*)
        repo_file=public-yum-el5.repo
        repo_name=el5_latest
        new_releases="oraclelinux-release enterprise-release"
        base_packages="$base_packages enterprise-release-notes"
        ;;
    *) exit_message "You appear to be running an unsupported distribution." ;;
esac

echo "Checking for yum lock..."
if [ -f /var/run/yum.pid ]; then
    yum_lock_pid=`cat /var/run/yum.pid`
    yum_lock_comm=`cat /proc/$yum_lock_pid/comm`
    exit_message "Another app is currently holding the yum lock.
The other application is: $yum_lock_comm
Running as pid: $yum_lock_pid
Run 'kill $yum_lock_pid' to stop it, then run this script again."
fi

echo "Looking for yumdownloader..."
if ! have_program yumdownloader; then
    yum -y install yum-utils || true
    dep_check yumdownloader
fi

echo "Finding your repository directory..."
reposdir=`python2 2> /dev/null <<EOF
import yum
import os

for dir in yum.YumBase().doConfigSetup(init_plugins=False).reposdir:
    if os.path.isdir(dir):
        print dir
        break
EOF`

if [ -z "$reposdir" ]; then
    exit_message "Could not locate your repository directory."
fi
cd "$reposdir"

echo "Downloading Oracle Linux yum repository file..."
if ! curl -O "${yum_url}/${repo_file}"; then
    exit_message "Could not download $repo_file from $yum_url.
Are you behind a proxy? If so, make sure the 'http_proxy' environment
variable is set with your proxy address."
fi

cd `mktemp -d`
trap restore_repos ERR

echo "Backing up and removing old repository files..."
rpm -ql "$old_release" | grep '\.repo$' > repo_files
while read repo; do
    if [ -f "$repo" ]; then
        cat - "$repo" > "$repo".disabled <<EOF
# This is a yum repository file that was disabled by
# ${0##*/}, a script to convert CentOS to Oracle Linux.
# Please see $yum_url for more information.

EOF
        tmpfile=`mktemp repo.XXXXX`
        echo "$repo" | cat - "$repo" > "$tmpfile"
        rm "$repo"
    fi
done < repo_files

echo "Downloading Oracle Linux release package..."
if ! yumdownloader $new_releases; then
    {
        echo "Could not download the following packages from $yum_url:"
        echo "$new_releases"
        echo
        echo "Are you behind a proxy? If so, make sure the 'http_proxy' environment"
        echo "variable is set with your proxy address."
    } >&2
    restore_repos
fi

echo "Switching old release package with Oracle Linux..."
rpm -i --force *.rpm
rpm -e --nodeps "$old_release"

# At this point, the switch is completed.
trap - ERR

echo "Installing base packages for Oracle Linux..."
if ! yum shell -y <<EOF
remove $bad_packages
install $base_packages
run
EOF
then
    exit_message "Could not install base packages.
Run 'yum distro-sync' to manually install them."
fi
if [ -x /usr/libexec/plymouth/plymouth-update-initrd ]; then
    echo "Updating initrd..."
    /usr/libexec/plymouth/plymouth-update-initrd
fi

echo "Installation successful!"
echo "Run 'yum distro-sync' to synchronize your installed packages"
echo "with the Oracle Linux repository."
