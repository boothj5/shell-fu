#!/bin/bash

umask 077

PERSON=/tmp/pd.key.person.$$ 
OFFICE=/tmp/pd.key.office.$$
TELEPHONE=/tmp/pd.key.telephone.$$
USER=/tmp/pd.key.user.$$

trap "exit 1"					HUP INT PIPE QUIT TERM
trap "rm -f $PERSON $OFFICE $TELEPHONE $USER"	EXIT

awk -F: '{ print $1 ":" $5 }' > $USER

sed -e 's=/.*==' -e 's=^\([^:]*\):\(.*\) \([^ ]*\)=\1:\3, \2=' <$USER | sort >$PERSON

sed -e 's=^\([^:]*\):[^/]*/\([^/]*\)/.*$=\1:\2=' < $USER | sort > $OFFICE

sed -e 's=^\([^:]*\):[^/]*/[^/]*/\([^/]*\)=\1:\2=' < $USER | sort > $TELEPHONE

join -t: $PERSON $OFFICE |
    join -t: - $TELEPHONE |
        cut -d: -f 2- |
            sort -t: -k1,1 -k2,2 -k3,3 |
                awk -F: ' { printf("%-39s\t%s\t%s\n", $1, $2, $3) }'
