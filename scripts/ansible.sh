#!/bin/bash -e

echo "*** Installing Ansible ***"
apt-get -y install --reinstall ca-certificates
apt-get -y install software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get -y install ansible

echo "*** Installing Ansible roles ***"
ansible-galaxy install geerlingguy.apache
ansible-galaxy install geerlingguy.mysql

echo "*** Configuring Ansible to run on localhost ***"
echo 'localhost ansible_connection=local' > /etc/ansible/hosts
