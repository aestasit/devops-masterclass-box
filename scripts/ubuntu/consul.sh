#!/bin/bash -e -x

DEBIAN_FRONTEND=noninteractive
export DEBIAN_FRONTEND

echo "*** Installing Consul ***"
wget --quiet https://releases.hashicorp.com/consul/1.5.1/consul_1.5.1_linux_amd64.zip
unzip -q consul_*.zip -d /usr/bin
rm -rf consul_*.zip

echo "*** Checking Consul installation ***"
consul version
