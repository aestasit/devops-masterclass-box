#!/bin/bash -e -x

echo "*** Installing tools ***"
sudo yum -y install zip wget curl mc links tree cifs-utils nano vim-enhanced
sudo yum -y install python-pip
sudo -H pip install -U pip
sudo yum -y install httpie python2-httpie
sudo wget --quiet --no-check-certificate https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 -O /usr/bin/jq
sudo chmod a+x /usr/bin/jq
