@echo off
@call vagrant box remove --all --force aestasit/devops-ubuntu-14.04 
@call vagrant box add -f aestasit/devops-ubuntu-14.04 output/devops-ubuntu-14-04-x64-virtualbox-*.box 