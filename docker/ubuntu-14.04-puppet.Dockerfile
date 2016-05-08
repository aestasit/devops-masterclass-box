FROM ubuntu:14.04

RUN  apt-get -y update && \ 
     apt-get -y install curl && \
     curl -O https://apt.puppetlabs.com/puppetlabs-release-trusty.deb && \
     dpkg -i puppetlabs-release-trusty.deb && \
     apt-get -y update && \ 
     apt-get -y install puppet && \
     cd /etc/puppet && \
     touch hiera.yaml && \
     sed -i '/templatedir.*/d' puppet.conf && \
     puppet module install puppetlabs-stdlib && \
     puppet module install puppetlabs-concat && \
     puppet module install puppetlabs-apache && \
     puppet module install puppetlabs-mysql && \
     apt-get clean && \
     rm -rf /var/lib/apt/lists/*

