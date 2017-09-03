#!/bin/bash -e -x

echo "*** Preparing ***"
rm /var/cache/debconf/*.dat
apt-get -y -qq clean
apt-get -y -qq install -o=Dpkg::Use-Pty=0 --reinstall debconf
dpkg-reconfigure debconf

echo "*** Updating system ***"
DEBIAN_FRONTEND=noninteractive
UCF_FORCE_CONFFNEW=true
export UCF_FORCE_CONFFNEW DEBIAN_FRONTEND
sed -i 's/console=hvc0/console=ttyS0/' /boot/grub/menu.lst
sed -i 's/LABEL=UEFI.*//' /etc/fstab
apt-get -y -qq update -o=Dpkg::Use-Pty=0
apt-get -y -qq upgrade -o=Dpkg::Use-Pty=0
apt-get -y -qq install -o=Dpkg::Use-Pty=0 linux-headers-$(uname -r)

echo "*** Configuring permissions ***"
sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=sudo' /etc/sudoers
sed -i -e 's/%sudo  ALL=(ALL:ALL) ALL/%sudo  ALL=NOPASSWD:ALL/g' /etc/sudoers
echo "UseDNS no" >> /etc/ssh/sshd_config

echo "*** Installing tools ***"
apt-get -qq -y install -o=Dpkg::Use-Pty=0 zip wget curl mc links tree tofrodos git
apt-get -qq -y install -o=Dpkg::Use-Pty=0 apt-transport-https ca-certificates software-properties-common

apt-get -y -qq install -o=Dpkg::Use-Pty=0 python-pip
apt-get -y -qq install -o=Dpkg::Use-Pty=0 libyaml-dev python-dev
apt-get -y -qq install -o=Dpkg::Use-Pty=0 python-yaml

apt-get -y -qq install -o=Dpkg::Use-Pty=0 httpie
apt-get -y -qq install -o=Dpkg::Use-Pty=0 fabric

wget --quiet --no-check-certificate https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 -O /usr/bin/jq
chmod a+x /usr/bin/jq
