#!/bin/sh -eux

echo "Full disk capacity for /dev/sda3"
# Increase the Physical Volume (pv) to max size
pvresize /dev/sda3
# Expand the Logical Volume (LV) to max size to match
lvresize -l +100%FREE /dev/mapper/ubuntu--vg-ubuntu--lv
# Expand the filesystem itself
resize2fs /dev/mapper/ubuntu--vg-ubuntu--lv
