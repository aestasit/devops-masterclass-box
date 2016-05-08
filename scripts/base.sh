#!/bin/bash -e

echo "*** Updating system ***"
apt-get update
apt-get -y upgrade
apt-get -y install linux-headers-$(uname -r)

echo "*** Configuring permissions ***"
sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=sudo' /etc/sudoers
sed -i -e 's/%sudo  ALL=(ALL:ALL) ALL/%sudo  ALL=NOPASSWD:ALL/g' /etc/sudoers
echo "UseDNS no" >> /etc/ssh/sshd_config

echo "*** Installing tools ***"
apt-get install -y zip wget curl mc links tree tofrodos git



