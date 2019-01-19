#!/bin/bash


if [ $# -ne 2 ]
then
  echo "Script $0 require device and ifo files to be provided as arguments:"
  echo "  `basename $0` <devname> <isofile>"
  exit 2
fi

if [ ! -b $1 ]
then
  echo "$1 is not block device."
  exit 3
fi

if [ ! -f $2 ]
then
  echo "$2 is not valid iso file."
  exit 3
fi

sudo /opt/etcher-cli/etcher -d $1 -y $2

