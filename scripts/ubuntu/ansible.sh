#!/bin/bash -e -x

DEBIAN_FRONTEND=noninteractive
export DEBIAN_FRONTEND

echo "*** Installing Ansible ***"
apt-add-repository -y ppa:ansible/ansible
apt-get -y -qq update -o=Dpkg::Use-Pty=0 
apt-get -y -qq install -o=Dpkg::Use-Pty=0 ansible
sudo -H pip uninstall docker-py; sudo -H pip uninstall docker; sudo -H pip install docker
sudo -H pip install lxml

echo "*** Configuring Ansible to run on localhost ***"
echo 'localhost ansible_connection=local' > /etc/ansible/hosts
cp /tmp/files/ansible.cfg /etc/ansible
 
echo "*** Checking Ansible installation ***"
python --version
ansible --version && chown -R "$(logname):$(logname)" "/home/$(logname)/.ansible"
