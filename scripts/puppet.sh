#!/bin/bash -e -x

echo "*** Installing Puppet ***"
curl -O "https://apt.puppetlabs.com/puppetlabs-release-pc1-$(lsb_release -c -s).deb"
dpkg -i puppetlabs-release-*.deb
rm -rf puppetlabs-release-*

touch /etc/apt/preferences
mkdir -p /etc/apt/preferences.d
cat >/etc/apt/preferences.d/puppetlabs.pref <<EOF
Package: *
Pin: origin apt.puppetlabs.com
Pin-Priority: 1001
EOF

cat /etc/apt/preferences.d/puppetlabs.pref

apt-get -y -qq update -o=Dpkg::Use-Pty=0
apt-get -y -qq install -o=Dpkg::Use-Pty=0 puppet
sed -i.bak '/templatedir/d' /etc/puppet/puppet.conf

echo "*** Checking Puppet installation ***"
puppet --version
