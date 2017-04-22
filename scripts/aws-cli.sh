#!/bin/bash -e -x

echo "*** Installing AWS CLI ***"
cd /root ; pip install --upgrade awscli

echo "*** Checking AWS CLI installation ***"
aws --version
