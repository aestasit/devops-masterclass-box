#!/bin/bash -e -x

sudo useradd oracle
sudo usermod -aG docker oracle

sudo sed -i \
	-e 's/name: centos/name: oracle/' \
	-e 's/gecos: .*/gecos: Oracle Default User/' \
	/etc/cloud/cloud.cfg
  