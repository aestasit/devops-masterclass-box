#!/bin/bash -e -x

DEBIAN_FRONTEND=noninteractive
export DEBIAN_FRONTEND

echo "*** Installing Packer ***"
wget --quiet https://releases.hashicorp.com/packer/1.4.1/packer_1.4.1_linux_amd64.zip
unzip -q packer_*.zip -d /usr/bin
rm -rf packer_*.zip

echo "*** Checking Packer installation ***"
packer version
