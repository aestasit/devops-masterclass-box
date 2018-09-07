#!/bin/bash -e -x

echo "*** Configuring permissions ***"
sudo sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=sudo' /etc/sudoers
sudo sed -i -e 's/%sudo  ALL=(ALL:ALL) ALL/%sudo  ALL=NOPASSWD:ALL/g' /etc/sudoers
sudo echo "UseDNS no" >> /etc/ssh/sshd_config

echo "*** Installing tools ***"
sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum -y install zip wget curl mc links tree cifs-utils 
sudo yum -y install python-pip
sudo -H pip install -U pip
sudo yum -y install httpie
sudo wget --quiet --no-check-certificate https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 -O /usr/bin/jq
sudo chmod a+x /usr/bin/jq
