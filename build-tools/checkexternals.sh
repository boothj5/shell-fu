#!/bin/sh

# make sure externals are on the same server as the branches themselves
# working copies need to exsist already, this script doesn't check out for you

base_path=/home/james/projects-svn-jamesbuntu
components="corelogic-checkserializable corelogic-common corelogic-fileloader corelogic-frameworki corelogic-frameworki-codegen corelogic-frameworki-mobile corelogic-frameworki-xb corelogic-interfaceserver corelogic-interfaceserver-xb corelogic-jobs corelogic-jobs-admin-tool corelogic-logging corelogic-master-build corelogic-portlet corelogic-test-framework"
svn_url=http://jamesbuntu.corelogic.local/svn/main

for component in $components; do

	svn propget -R svn:externals $base_path/$component

done

