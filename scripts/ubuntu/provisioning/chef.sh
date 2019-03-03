#!/bin/bash -e -x

DEBIAN_FRONTEND=noninteractive
export DEBIAN_FRONTEND

echo "*** Installing Chef ***"
curl -k -L -O "https://packages.chef.io/files/stable/chefdk/3.8.14/ubuntu/$(lsb_release -r -s)/chefdk_3.8.14-1_amd64.deb"
dpkg -i chefdk_*.deb
rm -rf chefdk_*.deb

echo "*** Checking Chef installation ***"
chef-solo --version
