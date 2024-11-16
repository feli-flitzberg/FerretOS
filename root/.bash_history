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
cd sources
tar -vxf man-pages-6.9.1.tar.xz 
cd man-pages-6.9.1
rm -v man3/crypt*
make prefix=/usr install
cd ..
rm -rfv man-pages-6.9.1
mv -v man-pages-6.9.1.tar.xz base
ls
tar -vxf iana-etc-20240806.tar.gz 
cd iana-etc-20240806
cp -v services protocols /etc
cd ..
rm -rfv iana-etc-20240806
mv -v iana-etc-20240806.tar.gz base
ls
tar -vxf glibc-2.40.tar.xz 
cd glibc-2.40
patch -Np1 -i ../glibc-2.40-fhs-1.patch 
mkdir -v build
cd build
echo "rootsbindir=/usr/sbin" > configparms
../configure --prefix=/usr --disable-werror --enable-kernel=4.19 --enable-stack-protector=strong --disable-nscd libc_cv_slibdir=/usr/lib && make && make check
grep "Timed out" $(find -name \*.out)
touch /etc/ld.so.conf
sed '/test-installation/s@$(PERL)@echo not running@' -i ../Makefile
make install
sed '/RTLDLIST=/s@/usr@@g' -i /usr/bin/ldd
localedef -i C -f UTF-8 C.UTF-8
localedef -i cs_CZ -f UTF-8 cs_CZ.UTF-8
localedef -i de_DE -f ISO-8859-1 de_DE
localedef -i de_DE@euro -f ISO-8859-15 de_DE@euro
localedef -i de_DE -f UTF-8 de_DE.UTF-8
localedef -i el_GR -f ISO-8859-7 el_GR
localedef -i en_GB -f ISO-8859-1 en_GB
localedef -i en_GB -f UTF-8 en_GB.UTF-8
localedef -i en_HK -f ISO-8859-1 en_HK
localedef -i en_PH -f ISO-8859-1 en_PH
localedef -i en_US -f ISO-8859-1 en_US
localedef -i en_US -f UTF-8 en_US.UTF-8
localedef -i es_ES -f ISO-8859-15 es_ES@euro
localedef -i es_MX -f ISO-8859-1 es_MX
localedef -i fa_IR -f UTF-8 fa_IR
localedef -i fr_FR -f ISO-8859-1 fr_FR
localedef -i fr_FR@euro -f ISO-8859-15 fr_FR@euro
localedef -i fr_FR -f UTF-8 fr_FR.UTF-8
localedef -i is_IS -f ISO-8859-1 is_IS
localedef -i is_IS -f UTF-8 is_IS.UTF-8
localedef -i it_IT -f ISO-8859-1 it_IT
localedef -i it_IT -f ISO-8859-15 it_IT@euro
localedef -i it_IT -f UTF-8 it_IT.UTF-8
localedef -i ja_JP -f EUC-JP ja_JP
localedef -i ja_JP -f SHIFT_JIS ja_JP.SJIS 2> /dev/null || true
localedef -i ja_JP -f UTF-8 ja_JP.UTF-8
localedef -i nl_NL@euro -f ISO-8859-15 nl_NL@euro
localedef -i ru_RU -f KOI8-R ru_RU.KOI8-R
localedef -i ru_RU -f UTF-8 ru_RU.UTF-8
localedef -i se_NO -f UTF-8 se_NO.UTF-8
localedef -i ta_IN -f UTF-8 ta_IN.UTF-8
localedef -i tr_TR -f UTF-8 tr_TR.UTF-8
localedef -i zh_CN -f GB18030 zh_CN.GB18030
localedef -i zh_HK -f BIG5-HKSCS zh_HK.BIG5-HKSCS
localedef -i zh_TW -f UTF-8 zh_TW.UTF-8
tar -xf ../../tzdata2024a.tar.gz 
ZONEINFO=/usr/share/zoneinfo
mkdir -pv $ZONEINFO/{posix,right}
for tz in etcetera southamerica northamerica europe africa antarctica asia australasia backward; do zic -L /dev/null -d $ZONEINFO ${tz}; zic -L /dev/null -d $ZONEINFO/posix ${tz}; zic -L leapseconds -d $ZONEINFO/right ${tz}; done
cp -v zone.tab zone1970.tab iso3166.tab $ZONEINFO
zic -d $ZONEINFO -p America/New_York
unset ZONEINFO
mkdir -pv /etc/ld.so.conf.d
cd ../..
rm -rfv glibc-2.40
mv -v glibc* tzdata2024a.tar.gz base
ls
tar -vxf libunistring-1.2.tar.xz 
cd libunistring-1.2
./configure --prefix=/usr --disable-static --docdir=/usr/share/doc/libunistring-1.2 && make && make install
ls /usr/lib/libuni*
cd ..
rm -rfv libunistring-1.2
mv -v libunistring-1.2.tar.xz extra
tar -vxf libidn2-2.3.7.tar.gz 
cd libidn2-2.3.7
./configure --prefix=/usr --disable-static && make && make install
cd ..
rm -rfv libidn2-2.3.7
mv -v libidn2-2.3.7.tar.gz extr
mv -v extr libidn2-2.3.7.tar.gz
mv -v libidn2-2.3.7.tar.gz extra
ls
exit
