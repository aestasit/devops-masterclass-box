@echo off
@rem call vagrant box remove --all --force aestasit/devops-ubuntu-16.04 
@call vagrant box add --force aestasit/devops-ubuntu-16.04 output/devops-ubuntu-16-04-x64-virtualbox-*.box 