#!/bin/bash -e -x

DEBIAN_FRONTEND=noninteractive
export DEBIAN_FRONTEND

echo "*** Installing VirtualBox guest utilities ***"
apt-get -y -qq install -o=Dpkg::Use-Pty=0 virtualbox-guest-utils
