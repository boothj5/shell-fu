#!/bin/sh

# Filesystem type
system="FAT32"

# disk blocks
large="488384001"
small="156288321"

large_device=`sudo fdisk -l | grep ${system} | grep ${large} | cut -d' ' -f1`
small_device=`sudo fdisk -l | grep ${system} | grep ${small} | cut -d' ' -f1`

if [ -n "$large_device" ]; then
    sudo mkdir -p /mnt/store_large
    sudo mount -o uid=james,gid=users,fmask=113,dmask=002 $large_device /mnt/store_large
    echo 500GB drive $large_device mounted at /mnt/store_large
fi

if [ -n "$small_device" ]; then
    sudo mkdir -p /mnt/store_small
    sudo mount -o uid=james,gid=users,fmask=113,dmask=002 $small_device /mnt/store_small
    echo 160GB drive $small_device mounted at /mnt/store_small
fi
