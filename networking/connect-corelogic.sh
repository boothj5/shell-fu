#!/bin/bash

# prompt for domain password
printf "Enter domain password: "
stty -echo
read password < /dev/tty
stty echo
echo

# connect to vpn
sudo vpnc --enable-1des corelogic.conf

# route to servers
sudo route add -net 192.168.0.29 netmask 255.255.255.255 tun0 # hudson.corelogic.local
sudo route add -net 192.168.0.90 netmask 255.255.255.255 tun0 # james-pc.corelogic.local
sudo route add -net 192.168.0.10 netmask 255.255.255.255 tun0 # svn.corelogic.local
sudo route add -net 192.168.0.26 netmask 255.255.255.255 tun0 # framework2.corelogic.local

# mount filesystems
sudo mount -t cifs -o username=james.booth,password=$password,uid=james //192.168.0.26/Share ~/mnt/framework2/

