#!/usr/bin/bash
if [ $EUID -ne 0 ]; then
  echo "Need to be root"
  exit 1
fi

last_fs_inode=
last_file=
{ find /usr/lib -type f -name '*.so*' ! -name '*dbg'
  find /usr/lib -type f -name '*.a'
  find /usr/{bin,sbin,libexec} -type f
} | xargs stat -c '%m %i %n' | sort | while read fs inode file; do
       if ! readelf -h $file >/dev/null 2>&1; then continue; fi
       if file $file | grep --quiet --invert-match 'not stripped'; then continue; fi

       if [ "$fs $inode" = "$last_fs_inode" ]; then
         ln -f $last_file $file;
         continue;
       fi

       cp --preserve $file    ${file}.tmp
       strip --strip-unneeded ${file}.tmp
       mv ${file}.tmp $file

       last_fs_inode="$fs $inode"
       last_file=$file
done
