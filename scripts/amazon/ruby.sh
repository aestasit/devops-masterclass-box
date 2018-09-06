#!/bin/bash -e -x

echo "*** Installing Ruby ***"
sudo yum -y install ruby
sudo gem install bundler
sudo gem install rake

echo "*** Checking Ruby installation ***"
ruby -v
rake --version
bundle version

