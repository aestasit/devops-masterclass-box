@echo off

set VERSION=2018-05-12

call vagrant box remove --provider vmware_desktop --force aestasit/devops-ubuntu-16.04 
call vagrant box add --provider vmware_desktop --force aestasit/devops-ubuntu-16.04 file://.output/devops-ubuntu-16-04-x64-vmware-%VERSION%.box 

call vagrant box remove --provider hyperv --force aestasit/devops-ubuntu-16.04 
call vagrant box add --provider hyperv --force aestasit/devops-ubuntu-16.04 file://.output/devops-ubuntu-16-04-x64-hyperv-%VERSION%.box 

call vagrant box remove --provider virtualbox --force aestasit/devops-ubuntu-16.04 
call vagrant box add --provider virtualbox --force aestasit/devops-ubuntu-16.04 file://.output/devops-ubuntu-16-04-x64-virtualbox-%VERSION%.box 
