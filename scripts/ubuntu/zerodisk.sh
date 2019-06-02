#!/bin/bash -e -x

DEBIAN_FRONTEND=noninteractive
export DEBIAN_FRONTEND

echo "*** Optimizing box disk space ***"
dd if=/dev/zero of=/EMPTY bs=1M || true
rm -f /EMPTY
