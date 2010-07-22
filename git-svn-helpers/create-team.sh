#!/bin/sh

# assume this is run in the directory where the projects-git-RELEASE folder is.

release_url=http://jamesbuntu.corelogic.local/gitweb-release/
release_git_url=git://jamesbuntu.corelogic.local/projects-git-RELEASE-pub
base_path=/home/james
private=projects-git-TEAM
public=projects-git-TEAM-pub

# create folders
mkdir $base_path/$private

curl -s $release_url | sed 's/.*\(corelogic-[a-z0-9\-]*\).*/\1/g' | grep corelogic | grep -v jamesbuntu | sort -u > /tmp/teamrepolist

while read line
do
	echo $line
	echo $base_path/$private
	cd $base_path/$private

	git clone $release_git_url/$line.git

done < /tmp/teamrepolist

# clean up
rm /tmp/teamrepolist
