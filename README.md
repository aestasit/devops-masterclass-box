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

## Vagrant

Vagrant/Virtualbox boxes are uploaded to Atlas:

- <https://atlas.hashicorp.com/aestasit/boxes/devops-ubuntu-14.04/>
- <https://atlas.hashicorp.com/aestasit/boxes/devops-ubuntu-16.04/> 

To start Vagrant/Virtualbox machine with Ubuntu 14.04 use the following command :

    vagrant init aestasit/devops-ubuntu-14.04
    vagrant up --provider virtualbox

To start Vagrant/Virtualbox machine with Ubuntu 16.04 use the following command :

    vagrant init aestasit/devops-ubuntu-16.04
    vagrant up --provider virtualbox

