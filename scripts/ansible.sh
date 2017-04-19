#!/bin/bash -e -x

echo "*** Installing Ansible ***"
apt-add-repository -y ppa:ansible/ansible
apt-get -y -qq update -o=Dpkg::Use-Pty=0 
apt-get -y -qq install -o=Dpkg::Use-Pty=0 ansible

echo "*** Installing Ansible roles ***"
ansible-galaxy install geerlingguy.apache
ansible-galaxy install geerlingguy.mysql

echo "*** Configuring Ansible to run on localhost ***"
echo 'localhost ansible_connection=local' > /etc/ansible/hosts
