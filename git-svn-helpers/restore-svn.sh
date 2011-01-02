#!/bin/sh

# must be called with sudo

svn_base_path=/home/svn
svn_repo=main
backup_suffix=orig

rm -rf $svn_base_path/$svn_repo

cp -r $svn_base_path/$svn_repo.$backup_suffix  $svn_base_path/$svn_repo

chown -R www-data:subversion $svn_base_path/$svn_repo
chmod -R g+rws $svn_base_path/$svn_repo
