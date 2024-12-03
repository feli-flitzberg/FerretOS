#!/bin/bash
# LFS can be set to almost any valid path
LFS=/opt/lfs

mount -v --bind /dev $LFS/dev
mount -vt devpts devpts -o gid=5,mode=0620 $LFS/dev/pts
mount -vt proc proc $LFS/proc
mount -vt sysfs sysfs $LFS/sys
mount -vt tmpfs tmpfs $LFS/run
if [ -h $LFS/dev/shm ]; then
  install -v -d -m 1777 $LFS$(realpath /dev/shm)
else
  mount -vt tmpfs -o nosuid,nodev tmpfs $LFS/dev/shm
fi
chroot "$LFS" /usr/bin/env -i HOME=/root TERM="$TERM" PS1='(lfs chroot) \u:\w\$ ' \
  PATH=/usr/bin:/usr/sbin MAKEFLAGS="-j4" TESTSUITEFLAGS="-j4" \
  /bin/bash --login
umount -v $LFS/dev/shm
umount -v $LFS/run
umount -v $LFS/sys
umount -v $LFS/proc
umount -v $LFS/dev/pts
umount -v $LFS/dev
