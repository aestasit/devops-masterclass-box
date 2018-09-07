#!/bin/bash -e -x

echo "*** Enable OL repos ***"
sudo yum-config-manager --enable ol7_UEKR5
sudo yum-config-manager --enable ol7_addons
sudo yum-config-manager --enable ol7_optional_latest
sudo yum-config-manager --enable ol7_developer
sudo yum-config-manager --enable ol7_developer_EPEL
sudo yum-config-manager --enable ol7_software_collection
