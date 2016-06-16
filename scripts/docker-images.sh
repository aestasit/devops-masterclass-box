#!/bin/bash -e

echo "*** Pulling Docker images ***"
docker pull ubuntu:14.04
docker pull jenkins:1.651.1
docker pull java:openjdk-6b38-jdk
docker pull java:openjdk-7u101-jdk
docker pull java:openjdk-8u72-jdk
docker pull node:5.11.1
docker pull node:6.1.0
docker pull ruby:2.1.9
docker pull ruby:2.2.5
docker pull ruby:2.3.1
docker pull python:2.7.11
docker pull python:3.5.1
docker pull nate/dockviz

echo "*** Building Docker images ***"
docker build -f /tmp/docker/ubuntu-14.04-puppet.Dockerfile --tag=devops-puppet:1.0 /tmp/docker
docker build -f /tmp/docker/ubuntu-14.04-ansible.Dockerfile --tag=devops-ansible:1.0 /tmp/docker
docker build -f /tmp/docker/ubuntu-14.04-chef.Dockerfile --tag=devops-chef:1.0 /tmp/docker
