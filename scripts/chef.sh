#!/bin/bash -e -x 

DEBIAN_FRONTEND=noninteractive
export DEBIAN_FRONTEND

echo "*** Installing Chef ***"              
curl -k -L -O "https://packages.chef.io/files/stable/chefdk/2.5.3/ubuntu/$(lsb_release -r -s)/chefdk_2.5.3-1_amd64.deb"               
dpkg -i chefdk_*.deb
rm -rf chefdk_*.deb

echo "*** Checking Chef installation ***"
chef-solo --version
