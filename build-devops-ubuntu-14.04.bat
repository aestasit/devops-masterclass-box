@echo off
@packer build -force boxes/devops-ubuntu-14.04-virtualbox.json
@packer build -force boxes/devops-ubuntu-14.04-aws.json
@pause