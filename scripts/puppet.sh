#!/bin/bash -e -x

echo "*** Installing Puppet ***"
curl -O https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
dpkg -i puppetlabs-release-trusty.deb
rm -rf puppetlabs-release*
apt-get -y -qq update -o=Dpkg::Use-Pty=0
apt-get -y -qq install -o=Dpkg::Use-Pty=0 puppet
sed -i.bak '/templatedir/d' /etc/puppet/puppet.conf

echo "*** Installing Puppet modules ***"
cd /etc/puppet ; sudo puppet module install puppetlabs-stdlib
cd /etc/puppet ; sudo puppet module install puppetlabs-concat
cd /etc/puppet ; sudo puppet module install puppetlabs-apache
cd /etc/puppet ; sudo puppet module install puppetlabs-mysql
