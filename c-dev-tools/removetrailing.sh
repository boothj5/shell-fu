#!/bin/sh
for f in src/*.c src/*.h; do sed -i 's/[ \t]*$//' $f; done
for f in tests/*.c tests/*.h; do sed -i 's/[ \t]*$//' $f; done
