#!/bin/bash

ivyLocation=/home/james/mnt/framework2/ivyrep/corelogic
components="corelogic-frameworki corelogic-interfaceserver corelogic-jobs corelogic-common"
keepLast=3

# Piped list of folders @ivyLocation, separated by new lines (-1)
folders=`ls -1 $ivyLocation`
# List of folders to skip separated by spaces
skipList=

echo folders:
echo $folders
echo
echo components:
echo $components
echo

for folder in $folders; do
#	if [ "$folder" in $skipList ] continue;
	
	for comp in $components; do

        	#Check for existence of component folder
		if [ -d "$ivyLocation/$folder/$comp" ]; then
			./ivy-housekeep.sh $ivyLocation/$folder/$comp $keepLast
		fi
	done
done
