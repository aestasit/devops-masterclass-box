#!/bin/bash -e -x

echo "*** Cleaning up DHCP leases ***"
sudo rm -rf /var/lib/dhclient/*

echo "*** Cleaning /tmp ***"
sudo rm -rf /tmp/*
sudo rm -rf /var/tmp/*

echo "*** Cleaning disabled repositories ***"
rm -rf /etc/yum.repos.d/*.disabled