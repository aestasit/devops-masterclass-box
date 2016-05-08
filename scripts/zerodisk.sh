#!/bin/bash -ex

dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
