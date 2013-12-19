#!/bin/sh
# 2013/12/19, sunsd

IGNORE="LINUX_2_6_x86_64"

pd=$(pd)
dir=$pd/$MOD
echo ----------------------------------------
echo chmod related paths to 750, files to 640
echo ----------------------------------------
echo cd $dir
cd $dir
dirs=$(find . -path "*$IGNORE*" -prune -o -type d -print)
chmod 750 $dirs
echo cd $pd
cd $pd
chmod 640 `cat colist`
[ $? -eq 0 ] && echo "Done. "
