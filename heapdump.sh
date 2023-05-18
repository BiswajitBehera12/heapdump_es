#!/usr/bin/env bash

shopt -s dotglob

HEAPDATE=$(date +%Y_%m_%d-%H_%M)
HEAPPATH=/data/$(hostname)

mkdir -p $HEAPPATH

jmap -dump:live,format=b,file=$HEAPPATH/$HEAPDATE.hprof $(pidof java)
echo 'Compressing heapdump...'
gzip -v $HEAPPATH/$HEAPDATE.hprof
