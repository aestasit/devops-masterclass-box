#!/bin/bash -e

echo "*** Updating system ***"
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

