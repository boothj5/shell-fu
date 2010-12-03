#!/bin/sh

# given the branch suffix, will create fwi, fis and quartz branches from trunk

echo Creating branches for $1
echo

svn cp -m "Created $1 branch" http://svn.corelogic.local/svn/main/trunk/corelogic-frameworki http://svn.corelogic.local/svn/main/branches/corelogic-frameworki/corelogic-frameworki-$1

svn cp -m "Created $1 branch" http://svn.corelogic.local/svn/main/trunk/corelogic-interfaceserver http://svn.corelogic.local/svn/main/branches/corelogic-interfaceserver/corelogic-interfaceserver-$1

svn cp -m "Created $1 branch" http://svn.corelogic.local/svn/main/trunk/corelogic-jobs http://svn.corelogic.local/svn/main/branches/corelogic-jobs/corelogic-jobs-$1

echo

echo Done

