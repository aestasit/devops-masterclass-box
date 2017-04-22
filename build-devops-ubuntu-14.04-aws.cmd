@echo off
@set PACKER_LOG=1
@set PACKER_LOG_PATH=devops-ubuntu-14.04-aws.log
@packer build -force boxes/devops-ubuntu-14.04-aws.json
@pause