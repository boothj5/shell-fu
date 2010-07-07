#!/bin/bash

ivyLocation=/home/james/mnt/framework2/ivyrep/corelogic
keepLast=3

# Piped list of folders @ivyLocation, separated by new lines (-1)
folders=`ls -1 $ivyLocation`
# List of folders to skip separated by spaces
skipList=

for folder in $folders; do

#	if [ "$folder" in $skipList ] continue;
	
	# Check for existence of corelogic-frameworki folder
	if [ -d "$ivyLocation/$folder/corelogic-frameworki" ]; then
		echo "./ivy-housekeep.sh $ivyLocation/$folder/corelogic-frameworki $keepLast"
	fi
	
	# Check for existence of corelogic-interfaceserver folder
	if [ -d "$ivyLocation/$folder/corelogic-interfaceserver" ]; then
		echo "./ivy-housekeep.sh $ivyLocation/$folder/corelogic-interfaceserver $keepLast"	
	fi
done