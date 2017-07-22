#!/bin/bash -e -x

echo "*** Installing Puppet ***"
curl -O "https://apt.puppetlabs.com/puppetlabs-release-pc1-$(lsb_release -c -s).deb"
dpkg -i puppetlabs-release-*.deb
rm -rf puppetlabs-release-*
apt-get -y -qq update -o=Dpkg::Use-Pty=0
apt-get -y -qq install -o=Dpkg::Use-Pty=0 puppet-agent

echo "*** Installing r10k ***"
/opt/puppetlabs/puppet/bin/gem install r10k
ln -s /opt/puppetlabs/puppet/bin/r10k /opt/puppetlabs/bin/r10k

echo "*** Checking Puppet installation ***"
cp /tmp/files/hiera.yml /etc/puppetlabs/puppet
/opt/puppetlabs/bin/r10k version
/opt/puppetlabs/bin/puppet --version
