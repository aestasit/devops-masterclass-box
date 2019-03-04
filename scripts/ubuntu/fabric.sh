#!/bin/bash -e -x

DEBIAN_FRONTEND=noninteractive
export DEBIAN_FRONTEND

echo "*** Installing pip ***"
sudo -H apt-get -y -qq install -o=Dpkg::Use-Pty=0 python-pip
sudo -H apt-get -y -qq install -o=Dpkg::Use-Pty=0 libyaml-dev python-dev
sudo -H apt-get -y -qq install -o=Dpkg::Use-Pty=0 python-yaml
sudo -H pip install -U pip
hash -r pip

echo "*** Installing fabric ***"
sudo -H pip install -U Crypto
sudo -H pip install -U fabric
