#!/bin/bash -ex

echo "*** Optimizing box disk space ***"
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
