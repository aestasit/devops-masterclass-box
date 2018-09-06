#!/bin/bash -e -x

echo "*** Installing Docker ***"
sudo yum -y install docker
sudo usermod -aG docker "$(logname)"
sudo cp /tmp/files/daemon.json /etc/docker
sudo service docker start

echo "*** Installing Docker Compose ***"
su -c "curl -sSL https://github.com/docker/compose/releases/download/1.22.0/docker-compose-Linux-x86_64 > /usr/local/bin/docker-compose"
sudo chmod +x /usr/local/bin/docker-compose

echo "*** Checking Docker installation ***"
sudo docker-compose version
sudo docker info
