#!/bin/bash -e -x

echo "*** Installing Terraform ***"
wget --quiet https://releases.hashicorp.com/terraform/0.9.3/terraform_0.9.3_linux_amd64.zip
unzip -q terraform_*.zip -d /usr/bin
rm -rf terraform_*.zip 

echo "*** Checking Terraform installation ***"
terraform version
 