#!/bin/bash -e -x

echo "*** Installing Git ***"
sudo yum -y install git

echo "*** Checking Git version ***"
git version
