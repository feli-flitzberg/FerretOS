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
cd sources
ls
tar -vxf zlib-1.3.1.tar.gz 
cd zlib-1.3.1
./configure --prefix=/usr && make && make install && rm -fv /usr/lib/libz.a
cd ..
rm -rfv zlib-1.3.1
mv -v zlib-1.3.1.tar.gz base
ls
ls base
ls
tar -vxf bzip2-1.0.8.tar.gz 
cd bzip2-1.0.8
patch -Np1 -i ../bzip2-1.0.8-install_docs-1.patch 
sed -i 's@\(ln -s -f \)$(PREFIX)/bin/@\1@' Makefile
make -f Makefile-libbz2_so 
make clean
make
make PREFIX=/usr install
cp -av libbz2.so.* /usr/lib
ln -sv libbz2.so.1.0.8 /usr/lib/libbz2.so
cp -v bzip2-shared /usr/bin/bzip2
for i in /usr/bin/{bzcat,bunzip2}; do ln -sfv bzip2 $i; done
rm -fv /usr/lib/libbz2.a
cd ..
rm -rfv bzip2-1.0.8
mv -v bzip2-1.0.8* base
ls
tar -vxf xz-5.6.2.tar.xz 
cd xz-5.6.2
./configure --prefix=/usr --disable-static --docdir=/usr/share/doc/xz-5.6.2 && make && make install
cd ..
rm -rfv xz-5.6.2
mv -v xz-5.6.2.tar.xz base
ls
ls base
tar -vxf lz4-1.10.0.tar.gz 
cd lz4-1.10.0
make BUILD_STATIC=no PREFIX=/usr && make BUILD_STATIC=no PREFIX=/usr install
cd ..
rm -rfv lz4-1.10.0
mv -v lz4-1.10.0.tar.gz base
ls
tar -vxf zstd-1.5.6.tar.gz 
cd zstd-1.5.6
make prefix=/usr && make prefix=/usr install && rm -v /usr/lib/libzstd.a
cd ..
rm -rfv zstd-1.5.6
mv -v zstd-1.5.6.tar.gz base
tar -vxf file-5.45.tar.gz 
cd file-5.45
./configure --prefix=/usr && make && make install
cd ..
rm -rfv file-5.45
mv -v file-5.45.tar.gz base
ls
tar -vxf readline-8.2.13.tar.gz 
cd readline-8.2.13
sed -i '/MV.*old/d' Makefile.in
sed -i '/{OLDSUFF}/c:' support/shlib-install
sed -i '/{OLDSTUFF}/c:' support/shlib-install
sed -i 's/-Wl,-rpath,[^ ]*//' support/shobj-conf
./configure --prefix=/usr --disable-static --with-curses --docdir=/usr/share/doc/readline-8.2.13 && make SHLIB_LIBS="-lncursesw" && make SHLIB_LIBS="-lncursesw" install
cd ..
rm -rfv readline-8.2.13
mv -v readline-8.2.13.tar.gz base
ls
tar -vxf m4-1.4.19.tar.xz 
cd m4-1.4.19
./configure --prefix=/usr && make && make install
cd ..
rm -rfv m4-1.4.19
mv -v m4-1.4.19.tar.xz base
ls
tar -vxf bc-6.7.6.tar.xz 
cd bc-6.7.6
CC=gcc ./configure --prefix=/usr -G -O3 -r && make && make install
cd ..
rm -rfv bc-6.7.6
mv -v bc-6.7.6.tar.xz base
ls
tar -vxf flex-2.6.4.tar.gz 
cd flex-2.6.4
./configure --prefix=/usr --docdir=/usr/share/doc/flex-2.6.4 --disable-static && make && make install && ln -sv flex /usr/bin/lex && ln -sv flex.1 /usr/share/man/man1/lex.1
cd ..
rm -rfv flex-2.6.4
mv -v flex-2.6.4.tar.gz base
ls
tar -vxf tcl8.6.14-src.tar.gz 
cd tcl8.6.14
SRCDIR=$(pwd)
cd unix
./configure --prefix=/usr                       --mandir=/usr/share/man             --disable-rpath
make
sed -e "s|$SRCDIR/unix|/usr/lib|"     -e "s|$SRCDIR|/usr/include|"      -i tclConfig.sh
sed -e "s|$SRCDIR/unix/pkgs/tdbc1.1.7|/usr/lib/tdbc1.1.7|"     -e "s|$SRCDIR/pkgs/tdbc1.1.7/generic|/usr/include|"        -e "s|$SRCDIR/pkgs/tdbc1.1.7/library|/usr/lib/tcl8.6|"     -e "s|$SRCDIR/pkgs/tdbc1.1.7|/usr/include|"                -i pkgs/tdbc1.1.7/tdbcConfig.sh
sed -e "s|$SRCDIR/unix/pkgs/itcl4.2.4|/usr/lib/itcl4.2.4|"     -e "s|$SRCDIR/pkgs/itcl4.2.4/generic|/usr/include|"        -e "s|$SRCDIR/pkgs/itcl4.2.4|/usr/include|"                -i pkgs/itcl4.2.4/itclConfig.sh
unset SRCDIR
make install
chmod -v u+w /usr/lib/libtcl8.6.so 
make install-private-headers
ln -sfv tclsh8.6 /usr/bin/tclsh
mv /usr/share/man/man3/{Thread,Tcl_Thread}.3
cd ../..
rm -rfv tcl8.6.14
mv -v tcl8.6.14-* base
ls
tar -vxf expect5.45.4.tar.gz 
cd expect5.45.4
python3 -c 'from pty import spawn; spawn(["echo", "ok"])'
patch -Np1 -i ../expect-5.45.4-gcc14-1.patch 
./configure --prefix=/usr --with-tcl=/usr/lib --enable-shared --disable-rpath --mandir=/usr/share/man --with-tclinclude=/usr/include && make && make install && ln -sfv expect5.45.4/libexpect5.45.4.so /usr/lib
cd ..
rm -rfv expect5.45.4
mv -v expect* base
tar -vxf dejagnu-1.6.3.tar.gz 
cd dejagnu-1.6.3
mkdir build
cd build
../configure --prefix=/usr && make install
cd ../..
rm -rfv dejagnu-1.6.3
mv -v dejagnu-1.6.3.tar.gz base
ls
tar -vxf pkgconf-2.3.0.tar.xz 
cd pkgconf-2.3.0
./configure --prefix=/usr --disable-static --docdir=/usr/share/doc/pkgconf-2.3.0 && make && make install
ln -sv pkgconf /usr/bin/pkg-config
ln -sv pkgconf.1 /usr/share/man/man1/pkg-config.1
cd ..
rm -rfv pkgconf-2.3.0
mv -v pkgconf-2.3.0.tar.xz base
ls
tar -vxf binutils-2.43.1.tar.xz 
cd binutils-2.43.1
mkdir build
cd build
../configure --prefix=/usr --sysconfdir=/etc --enable-gold --enable-ld=default --enable-plugins --enable-shared --disable-werror --enable-64-bit-bfd --with-system-zlib --enable-default-hash-style=gnu && make tooldir=/usr && make -k check
grep '^FAIL:' $(find -name '*.log')
make tooldir=/usr install
rm -fv /usr/lib/lib{bfd,ctf,ctf-nobfd,gprofng,opcodes,sframe}.a
cd ../..
rm -rfv binutils-2.43.1
mv -v binutils-2.43.1.tar.xz base
ls
exit
cd sources
ls
tar -vxf gmp-6.3.0.tar.xz 
cd gmp-6.3.0
./configure --prefix=/usr --enable-cxx --disable-static --docdir=/usr/share/doc/gmp-6.3.0 --disable-assembly
./configure --prefix=/usr --enable-cxx --disable-static --docdir=/usr/share/doc/gmp-6.3.0 --disable-assembly --host=amd64-pc-linux-gnu
make && make check 2>&1 | tee gmp-check-log
awk '/# PASS:/{total+=$3} ; END{print total}' gmp-check-log 
make install
cd ..
rm -rfv gmp-6.3.0
mv -v gmp-6.3.0.tar.xz base
ls
tar -vxf mpfr-4.2.1.tar.xz 
cd mpfr-4.2.1
./configure --prefix=/usr --disable-static --enable-thread-safe --docdir=/usr/share/doc/mpfr-4.2.1 && make && make check
cat INSTALL
cd ..
rm -rfv mpfr-4.2.1
tar -vxf mpfr-4.2.1.tar.xz 
cd mpfr-4.2.1
./configure --prefix=/usr --disable-static --enable-thread-safe --enable-decimal-float=generic --docdir=/usr/share/doc/mpfr-4.2.1 && make && make check
make install
cd ..
rm -rfv mpfr-4.2.1
mv -v mpfr-4.2.1.tar.xz base
ls
tar -vxf mpc-1.3.1.tar.gz 
cd mpc-1.3.1
./configure --prefix=/usr --disable-static --docdir=/usr/share/doc/mpc-1.3.1
make && make install
cd ..
rm -rfv mpc-1.3.1
mv -v mpc-1.3.1.tar.gz base
ls
tar -vxf attr-2.5.2.tar.gz 
cd attr-2.5.2
./configure --prefix=/usr --disable-static --sysconfdir=/etc --docdir=/usr/share/doc/attr-2.5.2 && make && make install
cd ..
rm -rfv attr-2.5.2
mv -v attr-2.5.2.tar.gz base
ls
tar -vxf acl-2.3.2.tar.xz 
cd acl-2.3.2
./configure --prefix=/usr --disable-static --docdir=/usr/share/doc/acl-2.3.2 && make && make install
cd ..
rm -rfv acl-2.3.2
mv -v acl-2.3.2.tar.xz base
ls
tar -vxf libcap-2.70.tar.xz 
cd libcap-2.70
sed -i '/install -m.*STA/d' libcap/Makefile
make prefix=/usr lib=lib && make prefix=/usr lib=lib install
cd ..
rm -rfv libcap-2.70
mv -v libcap-2.70.tar.xz base
ls
tar -vxf libxcrypt-4.4.36.tar.xz 
cd libxcrypt-4.4.36
./configure --prefix=/usr --enable-hashes=strong,glibc --enable-obsolete-api=no --disable-static --disable-failure-tokens && make && make install
cd ..
rm -rfv libxcrypt-4.4.36
mv -v libxcrypt-4.4.36.tar.xz base
ls
tar -vxf shadow-4.16.0.tar.xz 
cd shadow-4.16.0
sed -i 's/groups$(EXEEXT) //' src/Makefile.in
find man -name Makefile.in -exec sed -i 's/groups\.1 / /'   {} \;
find man -name Makefile.in -exec sed -i 's/getspnam\.3 / /' {} \;
find man -name Makefile.in -exec sed -i 's/passwd\.5 / /'   {} \;
sed -e 's:#ENCRYPT_METHOD DES:ENCRYPT_METHOD YESCRYPT:'     -e 's:/var/spool/mail:/var/mail:'                       -e '/PATH=/{s@/sbin:@@;s@/bin:@@}'                      -i etc/login.defs
touch /usr/bin/passwd
./configure --sysconfdir=/etc --disable-static --with-{b,yes}crypt --without-libbsd --with-group-name-max-length=32 && make && make exec_prefix=/usr install && make -C man install-man
pwconv
grpconv
mkdir -pv /etc/default
useradd -D --gid 999
sed -i '/MAIL/s/yes/no/' /etc/default/useradd
passwd root
cd ..
rm -rfv shadow-4.16.0
mv -v shadow-4.16.0.tar.xz base
ls
exit
