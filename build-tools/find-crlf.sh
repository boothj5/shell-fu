#!/bin/sh

find $1 -exec file {} \; | grep CRLF | cut -f 1 -d :
