#!/bin/bash -e -x

echo "*** Installing VMware tools ***"
apt-get -y -qq install -o=Dpkg::Use-Pty=0 open-vm-tools
