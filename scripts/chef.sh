#!/bin/bash -e

apt-get -y install curl
curl -k -L -O https://packages.chef.io/stable/ubuntu/12.04/chefdk_0.13.21-1_amd64.deb
dpkg -i chefdk_0.13.21-1_amd64.deb


