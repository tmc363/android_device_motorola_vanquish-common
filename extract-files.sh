#!/bin/sh

VENDOR=motorola
DEVICE=xt925

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary

rm -rf $BASE/*
rm -rf $BASE/../packages 2> /dev/null

for FILE in `cat proprietary-files.txt | grep -v ^# | cut -f1 -d '#' | grep -v ^$`; do
    DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
        mkdir -p $BASE/$DIR
    fi
    if [ "$COPY_FROM" = "" ]; then
        adb pull /system/$FILE $BASE/$FILE
    else
        cp -p "$COPY_FROM/$FILE" $BASE/$FILE
    fi
    if [ "X$DIR" == "Xapp" ]; then
        mkdir -p ${BASE}/../packages
        mv $BASE/$FILE ${BASE}/../packages/
    fi
done
rmdir ${BASE}/app 2> /dev/null

./setup-makefiles.sh
