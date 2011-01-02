#!/bin/sh

svn_url=http://jamesbuntu.corelogic.local/svn/main
component=$1
projects_base_folder=/home/james/projects-svn-dos2unix

cd $projects_base_folder

svn co $svn_url/trunk/$component

cd $component

find . -type f | grep -v \.svn | grep -v build-common | xargs dos2unix

svn commit -m "Line endings to nix style"

svn up
