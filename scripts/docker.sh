#!/bin/bash -e

echo "*** Configuring locales ***"
export DEBIAN_FRONTEND=noninteractive
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-8
dpkg-reconfigure locales

echo "*** Installing Docker ***"
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
mkdir -p /etc/apt/sources.list.d
su -c "echo deb https://apt.dockerproject.org/repo ubuntu-trusty main > /etc/apt/sources.list.d/docker.list"
apt-get update -q -y

echo "*** Installing AUFS ***"
apt-get -y install linux-image-extra-$(uname -r)
apt-get install -y -q docker-engine
usermod -aG docker vagrant

echo "*** Installing Docker Compose ***"
su -c "curl -sSL https://github.com/docker/compose/releases/download/1.4.0/docker-compose-Linux-x86_64 > /usr/local/bin/docker-compose"
chmod +x /usr/local/bin/docker-compose

echo "*** Pulling Docker images ***"
docker pull ubuntu:14.04
docker pull jenkins:1.651.1
docker pull java:openjdk-6b38-jdk
docker pull java:openjdk-7u101-jdk
docker pull java:openjdk-8u72-jdk
docker pull node:5.11.1
docker pull node:6.1.0
docker pull ruby:2.1.9
docker pull ruby:2.2.5
docker pull ruby:2.3.1
docker pull python:2.7.11
docker pull python:3.5.1
docker pull nate/dockviz

echo "*** Install utilities ***"
apt-get install -y -q graphviz

echo "*** Building Docker images ***"
# docker build -f /tmp/docker/ubuntu-14.04-puppet.Dockerfile --tag=devops-puppet:1.0 /tmp/docker
# docker build -f /tmp/docker/ubuntu-14.04-ansible.Dockerfile --tag=devops-ansible:1.0 /tmp/docker
# docker build -f /tmp/docker/ubuntu-14.04-chef.Dockerfile --tag=devops-chef:1.0 /tmp/docker
