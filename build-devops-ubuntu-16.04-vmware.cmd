@echo off
if not exist .logs mkdir .logs
if not exist .output mkdir .output
set PACKER_LOG=1
set PACKER_LOG_PATH=.logs\devops-ubuntu-16.04-vmware.log
set PACKER_CACHE_DIR=.cache
set TMPDIR=.tmp
del /s /q output\devops-ubuntu-16-04-x64-vmware*.box >nul 2>&1
packer build -force boxes\devops-ubuntu-16.04-vmware.json
pause
