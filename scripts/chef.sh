#!/bin/bash -e -x 

echo "*** Installing Chef ***"              
curl -k -L -O "https://packages.chef.io/files/stable/chefdk/2.0.28/ubuntu/$(lsb_release -r -s)/chefdk_2.0.28-1_amd64.deb"               
dpkg -i chefdk_*.deb
rm -rf chefdk_*.deb

echo "*** Checking Chef installation ***"
chef-solo --version
