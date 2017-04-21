#!/bin/bash -e -x 

echo "*** Installing Chef ***"              
curl -k -L -O "https://packages.chef.io/files/stable/chefdk/1.3.43/ubuntu/$(lsb_release -r -s)/chefdk_1.3.43-1_amd64.deb"
dpkg -i chefdk_*.deb
rm -rf chefdk_*.deb

echo "*** Checking Chef installation ***"
chef-solo --version
