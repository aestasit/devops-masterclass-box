#!/bin/bash -e -x

DEBIAN_FRONTEND=noninteractive
export DEBIAN_FRONTEND

while ! grep "Cloud-init .* finished" /var/log/cloud-init.log; do
    echo "$(date -Ins) Waiting for cloud-init to finish"
    sleep 2
done