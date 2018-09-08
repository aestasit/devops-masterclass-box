#!/bin/bash -e -x

echo "*** Installing Puppet ***"
sudo yum -y install https://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm
sudo yum -y install puppet
sudo yum -y install puppet-bolt
sudo yum -y install pdk
cp /tmp/files/hiera.yaml /etc/puppetlabs/puppet
cp /tmp/files/puppet.conf /etc/puppetlabs/puppet

echo "*** Installing r10k ***"
sudo /opt/puppetlabs/puppet/bin/gem install r10k
sudo ln -s /opt/puppetlabs/puppet/bin/r10k /opt/puppetlabs/bin/r10k

echo "*** Setting up global profile ***"
cp /tmp/files/puppet_profile.sh /etc/profile.d

echo "*** Checking Puppet installation ***"
bash -l -c "r10k version"
bash -l -c "puppet --version"
bash -l -c "bolt --version"
