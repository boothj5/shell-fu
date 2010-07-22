#!/bin/sh

# assume this is run in the directory where the projects-git-RELEASE folder is.

base_path=/home/james
private=projects-git-$1
public=projects-git-$1-pub
components=`ls -1 $base_path/$private`

mkdir $base_path/$public

for component in $components; do

	# create and initalise the public repo
	mkdir $base_path/$public/$component.git
	cd $base_path/$public/$component.git
	git init --bare
	# make it visible to git-daemon for sharing
	touch git-daemon-export-ok

	# push the content from private to public
	cd $base_path/$private/$component
	git push --all $base_path/$public/$component.git
	git push $base_path/$public/$component.git 'refs/remotes/svn/*:refs/heads/svn/*'

	# set up a remote to the public repository so we can push to it
	git remote add public file:///$base_path/$public/$component.git

	# go back to base
	cd $base_path
done


