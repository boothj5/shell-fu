#!/bin/bash

# Parameter one is the projects base folder (where all the components source is)
# e.g. /home/james/projects

components=`ls -1 $1 | grep corelogic-`

echo Components:
echo $components
echo

buildprops='build.properties'
depprops='dependencies.properties'

if [ $2 = 'test' ]
then
    buildprops='test-build.properties'
    depprops='test-dependencies.properties'
fi

if [ $2 = 'release' ]
then
    buildprops='release-build.properties'
    depprops='release-dependencies.properties'
fi

for comp in $components; do
	echo Component: 
	printf "\t%s\n" $comp
        
	rev=`cat $1/$comp/$buildprops | grep module.revision | sed 's/module.revision=\([0-9]\..*$\)/\1/g'`
	branch=`cat $1/$comp/$buildprops | grep module.branch | sed 's/module.branch=\(.*$\)/\1/g'`
	printf "\tRevision: %s\n" $rev
	printf "\tBranch: %s\n" $branch
	printf "Depends on :\n"
	cat $1/$comp/$depprops | grep ^corelogic | grep -v branch | sed 's/\(^corelogic.*\)\.rev=\(.*\)/\t\1: \2/g'
	printf "In branches:\n"
	cat $1/$comp/$depprops | grep ^corelogic | grep -v rev | sed 's/\(^corelogic.*\)\.branch=\(.*\)/\t\1: \2/g'
	echo	
done
