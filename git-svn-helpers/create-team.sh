#!/bin/sh

# assume this is run in the directory where the projects-git-RELEASE folder is.

release_url=http://jamesbuntu.corelogic.local/gitweb-release/
base_path=/home/james
private=projects-git-TEAM
public=projects-git-TEAM-pub

# String to look for
# <td><a class="list" href="/gitweb-release/?p=corelogic-checkserializable.git;a=summary">corelogic-checkserializable.git</a></td>

curl -s $release_url | grep '<td><a class="list" href="/gitweb-release/?p=corelogic-checkserializable.git;a=summary">corelogic-checkserializable.git</a></td>'




