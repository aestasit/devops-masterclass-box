
sudo -H apt-get -y -qq install -o=Dpkg::Use-Pty=0 python-pip
sudo -H apt-get -y -qq install -o=Dpkg::Use-Pty=0 libyaml-dev python-dev
sudo -H apt-get -y -qq install -o=Dpkg::Use-Pty=0 python-yaml

sudo -H pip install -U pip
hash -r pip


sudo -H pip install -U Crypto
sudo -H pip install -U fabric
