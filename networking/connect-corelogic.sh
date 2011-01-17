#!/bin/bash

# prompt for domain password
printf "Enter domain password: "
stty -echo
read password < /dev/tty
stty echo
echo

# connect to vpn
vpnc --enable-1des corelogic.conf

# route for corelogic machines 192.168.0.*
route add -net 192.168.0.0 netmask 255.255.255.0 tun0
route add -net 192.168.7.0 netmask 255.255.255.0 tun0
route add -net 192.168.40.0 netmask 255.255.255.0 tun0

# mount filesystems
mount -t cifs -o username=james.booth,password=$password,uid=james //framework2.corelogic.local/Share /home/james/mnt/framework2/

