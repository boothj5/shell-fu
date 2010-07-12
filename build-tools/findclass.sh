#!/bin/sh

# Given a directory and classname, will search all JAR files in that directory for the class

jars=`ls -1 $1/*.jar`

echo $jars

for jar in $jars; do
	jarname=`echo $jar | sed s'/.*\/\([a-zA-Z0-9\_\-]*\.jar$\)/\1/g'`
	echo Searching $jarname
	jar -tvf $jar | grep $2	
done

echo 
echo Done

