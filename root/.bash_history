mkdir -pv /{boot,home,mnt,opt,srv}
ls /usr/lib64
ls /usr/lib
mkdir -pv /etc/{opt,sysconfig}
mkdir -pv /lib/firmware
mkdir -pv /media/{floppy,cdrom}
mkdir -pv /usr/{,local/}{include,src}
mkdir -pv /usr/lib/locale
mkdir -pv /usr/local/{bin,lib,sbin}
mkdir -pv /usr/{,local/}share/{color,dict,doc,info,locale,man}
mkdir -pv /usr/{,local/}share/{misc,terminfo,zoneinfo
mkdir -pv /usr/{,local/}share/man/man{1..8}
mkdir -pv /var/{cache,local,log,mail,opt,spool}
mkdir -pv /var/lib/{color,misc,locate}
ln -sfv /run /var/run
ln -sfv /run/lock /var/lock
install -vdm0750 /root
install-vdm 1777 /tmp /var/tmp
install -vdm 1777 /tmp /var/tmp
ln -sv /proc/self/mounts /etc/mtab
localedef -i C -f UTF-8 C.UTF-8
echo "tester:x:101:101::/home/tester:/bin/bash" >> /etc/passwd
echo "tester:x:101:" >> /etc/group
install -o tester -d /home/tester
touch /var/log/{btmp,lastlog,faillog,wtmp}
chgrp -v utmp /var/log/lastlog
chmod -v 664 /var/log/lastlog
chmod -v 600 /var/log/btmp
cd sources
tar -vxf gettext-0.22.5.tar.xz 
cd gettext-0.22.5
./configure --disable-shared && make && cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /usr/bin
cd ..
rm -rfv gettext-0.22.5
tar -vxf bison-3.8.2.tar.xz 
cd bison-3.8.2
./configure --prefix=/usr --docdir=/usr/share/doc/bison-3.8.2 && make && make install
echo $MAKEFLAGS
cd ..
rm -rfv bison-3.8.2
tar -vxf perl-5.40.0.tar.xz 
cd perl-5.40.0
sh Configure -des -D prefix=/usr -D vendorprefix=/usr -D useshrplib -D privlib=/usr/lib/perl5/5.40/core_perl -D archlib=/usr/lib/perl5/5.40/core_perl -D sitelib=/usr/lib/perl5/5.40/site_perl -D sitearch=/usr/lib/perl5/5.40/site_perl -D vendorlib=/usr/lib/perl5/5.40/vendor_perl -D vendorarch=/usr/lib/perl5/5.40/vendor_perl && make && make install
cd ..
rm -rfv perl-5.40.0
tar -vxf Python-3.12.7.tar.xz 
cd Python-3.12.7
./configure --prefix=/usr --enable-shared --without-ensurepip && make && make install
cd ..
rm -rfv Python-3.12.7
tar -vxf texinfo-7.1.tar.xz 
cd texinfo-7.1
./configure --prefix=/usr && make && make install
cd ..
rm -rfv texinfo-7.1
tar -vxf util-linux-2.40.2.tar.xz 
cd util-linux-2.40.2
mkdir -pv /var/lib/hwclock
./configure --libdir=/usr/lib --runstatedir=/run --disable-chfn-chsh
./configure --libdir=/usr/lib --runstatedir=/run --disable-chfn-chsh --disable-login --disable-nologin --disable-su --disable-setpriv --disable-runuser --disable-pylibmount --disable-static --disable-liblastlog2 --without-python ADJTIME_PATH=/var/lib/hwclock/adjtime --docdir=/usr/share/doc/util-linux-2.40.2 && make && make install
cd ..
rm -rfv util-linux-2.40.2
rm -rf /usr/share/{info,man,doc}/*
find /usr/{lib,libexec} -name \*.la -delete
rm -rf /tools
exit
