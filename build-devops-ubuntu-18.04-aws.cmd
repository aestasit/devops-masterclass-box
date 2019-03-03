@echo off
if not exist .logs mkdir .logs
if not exist .output mkdir .output
set PACKER_LOG=1
set PACKER_LOG_PATH=.logs\devops-ubuntu-18.04-aws.log
set PACKER_CACHE_DIR=.cache
set TMPDIR=.tmp
packer build -force boxes\devops-ubuntu-18.04-aws.json
pause
