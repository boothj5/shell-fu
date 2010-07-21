#!/bin/sh

# assume this is run in the directory where the projects-git-RELEASE folder will be created
# assume user has authenticated with SVN already

components="corelogic-checkserializable corelogic-common corelogic-fileloader corelogic-frameworki corelogic-frameworki-codegen corelogic-frameworki-mobile corelogic-frameworki-xb corelogic-interfaceserver corelogic-interfaceserver-xb corelogic-jobs corelogic-jobs-admin-tool corelogic-logging corelogic-master-build corelogic-portlet corelogic-test-framework"
svn_url=http://svn.corelogic.local/svn/main
base_folder=projects-git-RELEASE

# create the base folder
mkdir $base_folder

for component in $components; do

	# clone each component into it
	git svn clone  $svn_url --trunk=trunk/$component --branches=branches/$component --prefix=svn/ c./$base_folder/$component

	# reset to HEAD to master as git by default will point it to the most recent commit 
	# of all in the tree
	cd /$base_folder/$component
	git reset --hard remotes/svn/trunk

	# got back to where we were
	cd ../../
done

