#!/bin/bash
# Script that gets all pq from geocaching.com, extracts the zip-file and merge
# all gpx files to one gpx.
# Uses geo-*:Rick Richardson's Linux tools for geocaching http://geo.rkkda.com/ and
# gctools https://github.com/btittelbach/gctools
#############################
echo "USERNAME=$USERNAME
PASSWORD=$USERPASS" > /root/.georc 
# Temp dir for working
WORKDIR="/mnt/pq"
# path to garmin eg. on osx
OUTDIR="/mnt/output"
# test if gps is mounted and clear old pq´s
if [ -d "$OUTDIR" ]; then
    rm -rf $OUTDIR/*
fi
# test if workindir exists
if [ -d "$WORKDIR" ]; then
  rm -rf $WORKDIR/*
  else 
  mkdir $WORKDIR
fi
echo "Downloading, extracting, copying to gps-device"
cd $WORKDIR ; geo-pqdownload ; unzip "*".zip ; cp *.gpx $OUTDIR/ ; rm -rf $WORKDIR/*
