#!/bin/bash

ls $1 | sed 's/.*-\([0-9]\.[0-9]\.[0-9]\.[0-9]\)\.[0-9]*.*/\1/' | sort -u > /tmp/file.txt

while read line  
do  

    #  Print everything out and store ordered build numbers in files

    echo ----------------
    echo Revsion: $line
    echo ----------------
    echo

    ls $1 | sed 's/.*-\([0-9]\.[0-9]\.[0-9]\.[0-9]\.[0-9]*\).*/\1/' | sort -Vu | grep ${line} | grep [0-9]\.[0-9]\.[0-9]\.[0-9]\.[0-9] > /tmp/${line}-devs.txt

    dev_num=`cat /tmp/${line}-devs.txt | wc -l`
#    dev_num=`expr $dev_num + 0`

    echo Development builds: ${dev_num}
    cat /tmp/${line}-devs.txt
    echo 

    ls $1 |  sed 's/.*-\([0-9]\.[0-9]\.[0-9]\.[0-9]\..*test[0-9]*\).*/\1/' | sort -u | grep ${line} | grep test > /tmp/${line}-tests.txt

    test_num=`cat /tmp/${line}-tests.txt | wc -l`
    
    echo Test builds: ${test_num}
    cat /tmp/${line}-tests.txt

    echo

    # if num dev build > 3, delete the oldest (total - 3) build

    if [ $dev_num -gt $2 ]
    then
        num_dev_delete=`expr $dev_num - $2`

	echo Removing ${num_dev_delete} dev builds
        
        while read another_line
	do
	    echo Deleting ... ${another_line}
#            ls $1/*${another_line}*
            num_dev_delete=`expr $num_dev_delete - 1`
            if [ $num_dev_delete = 0 ]
            then
                break
            fi
	done < /tmp/${line}-devs.txt
    else
	echo Not removing any dev builds
    fi

    #  Clean up tmp folder
    rm /tmp/${line}-devs.txt
    rm /tmp/${line}-tests.txt

done < /tmp/file.txt

rm /tmp/file.txt 
