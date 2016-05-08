FROM ubuntu:14.04

RUN  apt-get -y update && \ 
     apt-get -y install curl && \
     apt-get -y install --reinstall ca-certificates && \
     apt-get -y install ansible && \
     echo 'localhost ansible_connection=local' > /etc/ansible/hosts
     apt-get clean && \
     rm -rf /var/lib/apt/lists/*

