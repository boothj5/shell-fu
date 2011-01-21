#!/bin/sh

# lists files changed by user recently
# param1 : date in the format yyyy-mm-dd from when were looking for changes
# param2 : username e.g james.booth

svn log -v -r{$1}:HEAD | awk -v testuser=$2 '/^r[0-9]+ / {user=$3}  {if (user==testuser) {print $2}}' | sort | uniq
