#!/bin/bash -e -x

echo "*** Installing AWS CLI ***"
sudo -H pip install --upgrade awscli
sudo -H pip install --upgrade boto

echo "*** Checking AWS CLI installation ***"
aws --version
