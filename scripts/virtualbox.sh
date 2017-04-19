#!/bin/bash -e -x

echo "*** Installing VirtualBox guest utilities ***"
apt-get -y -qq install -o=Dpkg::Use-Pty=0 virtualbox-guest-utils
