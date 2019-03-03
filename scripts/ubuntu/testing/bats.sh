#!/bin/bash -e -x

DEBIAN_FRONTEND=noninteractive
export DEBIAN_FRONTEND

echo "*** Installing BATS ***"
git clone https://github.com/sstephenson/bats.git
cd bats
./install.sh /usr
cd ..
rm -rf bats

echo "*** Checking BATS installation ***"
bats --version
