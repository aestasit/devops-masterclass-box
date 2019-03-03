#!/bin/bash -e -x

echo "*** Installing GCP CLI ***"

curl https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-236.0.0-linux-x86_64.tar.gz --output google-cloud-sdk.tar.gz
tar -xvzf google-cloud-sdk.tar.gz
./google-cloud-sdk/install.sh
./google-cloud-sdk/bin/gcloud --quiet components update
rm -rf google-cloud-sdk.tar.gz
