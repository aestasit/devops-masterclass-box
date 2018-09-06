#!/bin/bash -e -x

echo "*** Optimizing box disk space ***"
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY
