#!/bin/bash -e

echo "*** Installing Ansible ***"
apt-get -y install --reinstall ca-certificates
apt-get -y install ansible

echo "*** Configuring Ansible to run on localhost ***"
echo 'localhost ansible_connection=local' > /etc/ansible/hosts
