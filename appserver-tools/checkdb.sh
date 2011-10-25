#!/bin/bash
#
# Determines which instances are connected to the specified database
#
owd=$PWD
cd $ORACLE_HOME/j2ee
echo
files=`find . -name data-sources.xml -type f`
echo Instance\(s\) connecting to $1:
for f in $files; do
  instance=`grep -il "$1" $f | cut -d '/' -f 2`
  if [ "$instance" != "" ]; then
    echo -n "  + "
    echo $instance
  fi
done
echo
cd $owd
