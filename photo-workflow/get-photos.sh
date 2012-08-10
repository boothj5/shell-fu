#!/bin/sh

mkdir -p ~/photos

exiftool -r -o . "-FileName<DateTimeOriginal" -d ~/photos/%Y/%m/%d%b%Y/%Y%m%d-%H%M%S%%-.c.%%e /mnt/card
