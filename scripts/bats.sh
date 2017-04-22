#!/bin/bash -e -x

echo "*** Installing BATS ***"
git clone https://github.com/sstephenson/bats.git
cd bats
./install.sh /usr
cd ..
rm -rf bats
