#!/bin/sh
for f in src/*.c src/*.h; do sed -i 's/[ \t]*$//' $f; done
for f in src/xmpp/*.c src/xmpp/*.h; do sed -i 's/[ \t]*$//' $f; done
for f in src/ui/*.c src/ui/*.h; do sed -i 's/[ \t]*$//' $f; done
for f in src/tools/*.c src/tools/*.h; do sed -i 's/[ \t]*$//' $f; done
for f in src/command/*.c src/command/*.h; do sed -i 's/[ \t]*$//' $f; done
for f in src/config/*.c src/config/*.h; do sed -i 's/[ \t]*$//' $f; done
for f in tests/*.c tests/*.h; do sed -i 's/[ \t]*$//' $f; done
