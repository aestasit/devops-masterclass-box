#!/bin/bash -e -x

echo "*** Configuring permissions ***"
sudo sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=sudo' /etc/sudoers
sudo sed -i -e 's/%sudo  ALL=(ALL:ALL) ALL/%sudo  ALL=NOPASSWD:ALL/g' /etc/sudoers
# TODO: fix
# sudo echo "UseDNS no" >> /etc/ssh/sshd_config
# GSSAPIAuthentication no
# UseDNS no

