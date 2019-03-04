
# devops-masterclass-box

Packer build for boxes used during DevOps Masterclass course for playing with provisioning tools and containers.

The final images will have the following software:

- Git 2.+
- Docker CE 18.+ and Docker Compose
- Kubectl 1.10.+, Helm 2.+ and Minicube 0.26.+
- Puppet 6.+, Puppet Bolt 1.+ and r10k
- Ansible 2.+
- Chef DK 3.+
- Terraform 0.11.+
- Consul 1.+
- AWS Client 1.+
- GCP Client 229.+
- OpenJDK 1.8.+
- Groovy 2.4.+
- Node JS 9.+ and Yarn 1.6.+
- Ruby 2.3.+
- jq 1.5
- BATS
- Serverpec
- and several others

## Build

Boxes are generated with Packer 1.2.3 and AWS, VirtualBox 5.2, Hyper-V, VMWare Workstation Pro.

In order to save the build log, it's worth setting the following environment variables:

    PACKER_LOG=1
    PACKER_LOG_PATH=devops-ubuntu-16.04-aws.log

To start the build, use the following command:

    packer build -force boxes/devops-ubuntu-16.04-aws.json

**NOTE:** Packer build files for AWS may need to be updated with the latest AMI ID for your region. Find the latest AMI ID at <https://cloud-images.ubuntu.com/locator/ec2/>.

**NOTE:** Before you can run Hyper-V build you have to create an external switch connected to the network card that is connected to the Internet with DHCP capability and name that router "external-wifi".

## Vagrant

Vagrant/Virtualbox boxes are uploaded to Vagrant Cloud:

- <https://app.vagrantup.com/aestasit/boxes/devops-ubuntu-16.04>

To start Vagrant/Virtualbox machine with Ubuntu 16.04 use the following command:

    vagrant init aestasit/devops-ubuntu-16.04
    vagrant up --provider virtualbox

