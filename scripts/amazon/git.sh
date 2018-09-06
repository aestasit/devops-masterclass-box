#!/bin/bash -e -x

echo "*** Installing Git ***"
sudo yum -y install git

echo "*** Installing Transcrypt ***"
sudo git clone https://github.com/elasticdog/transcrypt.git /usr/local/lib/transcrypt
sudo ln -s /usr/local/lib/transcrypt/transcrypt /usr/local/bin/transcrypt
sudo chmod +x /usr/local/bin/transcrypt

echo "*** Checking Git version ***"
git version
transcrypt --version
