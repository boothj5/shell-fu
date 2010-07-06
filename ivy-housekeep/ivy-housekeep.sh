#!/bin/bash

## Param 1 : Directory in which to look for builds
## Param 2 : No. of development builds to keep

# output revisions to temp file
# eg:
# 3.5.1.0
# 3.5.2.0
# 3.5.6.0
ls $1 | sed 's/.*-\([0-9]\.[0-9]\.[0-9]\.[0-9]\)\.[0-9]*.*/\1/' | sort -u > /tmp/file.txt

# loop through for each revision eg 3.5.1.0
while read line  
do  

    # print revision
    echo ----------------
    echo Revsion: $line
    echo ----------------
    echo

    # output the dev builds to a file
    # eg:
    # 3.5.1.0.12
    # 3.5.1.0.13
    # 3.5.1.0.14
    # 3.5.1.0.15
    ls $1 | sed 's/.*-\([0-9]\.[0-9]\.[0-9]\.[0-9]\.[0-9]*\).*/\1/' | sort -Vu | grep ${line} | grep [0-9]\.[0-9]\.[0-9]\.[0-9]\.[0-9] > /tmp/${line}-devs.txt

    # count the dev builds and output the number and the revisions
    dev_num=`cat /tmp/${line}-devs.txt | wc -l`
    echo Development builds: ${dev_num}
    cat /tmp/${line}-devs.txt

    echo 

    # output the test builds to a file
    ls $1 |  sed 's/.*-\([0-9]\.[0-9]\.[0-9]\.[0-9]\..*test[0-9]*\).*/\1/' | sort -u | grep ${line} | grep test > /tmp/${line}-tests.txt

    # count the test builds and output the number and the revisions
    test_num=`cat /tmp/${line}-tests.txt | wc -l`
    echo Test builds: ${test_num}
    cat /tmp/${line}-tests.txt

    echo

    # if number of dev builds greater than how many we wish to keep
    # delete the oldest (total - number to keep) builds
    if [ $dev_num -gt $2 ]
    then
        num_dev_delete=`expr $dev_num - $2`

	echo Removing ${num_dev_delete} dev builds
        
        while read another_line
	do
	    echo Deleting ... ${another_line}
            rm $1/*${another_line}.*
            num_dev_delete=`expr $num_dev_delete - 1`
            if [ $num_dev_delete = 0 ]
            then
                break
            fi
	done < /tmp/${line}-devs.txt
    # otherwise dont delete any
    else
	echo Not removing any dev builds
    fi

    #  Clean up tmp folder
    rm /tmp/${line}-devs.txt
    rm /tmp/${line}-tests.txt

done < /tmp/file.txt

# clean up tmp folder
rm /tmp/file.txt 
