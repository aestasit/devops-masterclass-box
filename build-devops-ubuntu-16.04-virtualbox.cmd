@echo off
@set PACKER_LOG=1
@set PACKER_LOG_PATH=devops-ubuntu-16.04-virtualbox.log
@packer build -force boxes/devops-ubuntu-16.04-virtualbox.json
@pause
