@echo off
call vagrant box remove --all --force aestasit/devops-ubuntu-16.04 
call vagrant box add --provider hyperv --force aestasit/devops-ubuntu-16.04 .output/devops-ubuntu-16-04-x64-hyperv-*.box 
rem call vagrant box add --provider virtualbox --force aestasit/devops-ubuntu-16.04 .output/devops-ubuntu-16-04-x64-virtualbox-*.box 