@echo off
@packer build -force boxes/devops-ubuntu-16.04-virtualbox.json
@pause
@packer build -force boxes/devops-ubuntu-16.04-aws.json
@pause
