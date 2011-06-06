#!/bin/bash

# given the branch suffix $1, will try to checkout all components in a subfolder named $1 

components="corelogic-common corelogic-fileloader corelogic-frameworki corelogic-interfaceserver corelogic-frameworki-mobile corelogic-jobs corelogic-frameworki-xb corelogic-interfaceserver-xb"

echo Checking out $1
echo

mkdir $1

for component in $components;do

    # check out the branch
    svn co http://svn.corelogic.local/svn/main/branches/$component/$component-$1 $1/$component-$1
    
    if [ -d "$1/$component-$1" ]; then
        # go in the folder
        cd $1/$component-$1
    
        # create local-build.properties for linux
        echo -e "oc4j.server.home=/home/james/oc4j/j2ee/home\nivysettings.repository.local=/home/james/projects-svn/ivyrepository_local\nivysettings.repository.network=/home/james/mnt/framework2/ivyrep" > local-build.properties
    
        # do an initial resolve
        ant resolve

        cd ../..
    fi
done

echo

echo Done

