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

mkfs.vfat -nUBUNTUUEFI $1
mount $1 /mnt/usb
7z x $2 -o/mnt/usb/

ls /mnt/usb/

umount /mnt/usb

#sudo dd if=linuxium-v4.20-ubuntu-18.04.1-desktop-amd64.iso of=/dev/sdc bs=4M status=progress

