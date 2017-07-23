# devops-masterclass-box

Packer build for boxes used during DevOps Masterclass course for playing with provisioning tools and containers.

The final images will have the following software:

 - Puppet 4.+ and r10k
 - Ansible 2.+
 - Chef DK 1.3.+
 - Docker CE 17.+
 - Terraform 0.9.+
 - AWS Client 1.+
 - OpenJDK 1.8.+
 - Groovy 2.4.+
 - BATS

## Build

Boxes are generated with Packer 1.0.3 and VirtualBox 5.1.24.

In order to save the build log, it's worth setting the following environment variables:

    PACKER_LOG=1
    PACKER_LOG_PATH=devops-ubuntu-14.04-aws.log

To start the build, use the following command: 

    packer build -force boxes/devops-ubuntu-14.04-aws.json

## Vagrant

Vagrant/Virtualbox boxes are uploaded to Atlas:

- <https://atlas.hashicorp.com/aestasit/boxes/devops-ubuntu-14.04/>

To start Vagrant/Virtualbox machine with Ubuntu 14.04 use the following command:

    vagrant init aestasit/devops-ubuntu-14.04
    vagrant up --provider virtualbox

