#!/bin/bash -e -x

echo "*** Installing Puppet ***"
sudo yum -y install https://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm
sudo yum -y install puppet
cp /tmp/files/hiera.yaml /etc/puppetlabs/puppet
cp /tmp/files/puppet.conf /etc/puppetlabs/puppet

echo "*** Installing r10k ***"
sudo /opt/puppetlabs/puppet/bin/gem install r10k
sudo ln -s /opt/puppetlabs/puppet/bin/r10k /opt/puppetlabs/bin/r10k

echo "*** Checking Puppet installation ***"
/opt/puppetlabs/bin/r10k version
/opt/puppetlabs/bin/puppet --version
