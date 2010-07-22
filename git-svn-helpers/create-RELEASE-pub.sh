#!/bin/sh

# assume this is run in the directory where the projects-git-RELEASE folder is.

private=projects-git-RELEASE
public=projects-git-RELEASE-pub
components=`ls -1 $private`

mkdir $public

for component in $components; do

	# create and initalise the public repo
	mkdir ./$public/$component.git
	cd ./$public/$component.git
	git init --bare
	# make it visible to git-daemon for sharing
	touch git-daemon-export-ok

	# push the content from private to public
	cd ../../$private/$component
	git push --all ../../$public/$component.git
	git push ../../$public/$component.git 'refs/remotes/svn/*:refs/heads/svn/*'

	# go back to base
	cd ../../
done


