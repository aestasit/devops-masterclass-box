#!/bin/bash -e -x

echo "*** Installing kubectl ***"
apt-get -y -qq install -o=Dpkg::Use-Pty=0 bridge-utils
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl

echo "*** Installing minikube ***"
curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.21.0/minikube-linux-amd64 
chmod +x minikube 
mv minikube /usr/local/bin/

