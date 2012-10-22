#!/bin/sh
for f in *.c *.h; do sed -i 's/[ \t]*$//' $f; done
