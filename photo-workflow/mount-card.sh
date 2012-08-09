#!/bin/sh

# 8GB card UUID
card_uuid="4DCC-F3FA"
# Canon formatted 8GB card
eos_digital="EOS_DIGITAL"


# create mount point if it doesn't exist
sudo mkdir -p /mnt/card

device_path=`sudo blkid -o list -c /dev/null | grep -e ${card_uuid} -e ${eos_digital} | cut -d' ' -f1`

if [ -n "$device_path" ]; then
    echo Memory card $device_path mounted at /mnt/card
    sudo mount -o uid=james,gid=users,fmask=113,dmask=002 $device_path /mnt/card
else
    echo No memory card attached.
fi
