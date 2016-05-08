#!/bin/bash -e

# Fix error: unable to re-open stdin: No file or directory
export DEBIAN_FRONTEND=noninteractive
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
sudo locale-gen en_US.UTF-8
sudo dpkg-reconfigure locales

# Install Docker
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo mkdir -p /etc/apt/sources.list.d
sudo su -c "echo deb https://apt.dockerproject.org/repo ubuntu-trusty main > /etc/apt/sources.list.d/docker.list"
sudo apt-get update -q -y

# Setup AUFS
sudo apt-get -y install linux-image-extra-$(uname -r)
sudo apt-get install -y -q docker-engine
sudo usermod -aG docker vagrant

# Setup Docker Compose
sudo su -c "curl -sSL https://github.com/docker/compose/releases/download/1.4.0/docker-compose-Linux-x86_64 > /usr/local/bin/docker-compose"
sudo chmod +x /usr/local/bin/docker-compose

