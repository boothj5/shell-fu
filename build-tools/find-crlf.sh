#!/bin/sh

find $1 -exec file {} \; | grep CRLF | sed 's/\([^:]*\):.*/\1/'
