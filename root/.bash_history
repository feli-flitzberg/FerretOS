cd ..
rm -rfv ncurses-6.5
mv -v ncurses-6.5.tar.gz base
tar -vxf sed-4.9.tar.xz 
cd sed-4.9
./configure --prefix=/usr && make && make install
cd ..
rm -rfv sed-4.9
mv -v sed-4.9.tar.xz base/
ls
ls --color
ls --help
ls --color=auto
tar -vxf psmisc-23.7.tar.xz 
cd psmisc-23.7
./configure --prefix=/usr && make && make install
cd ..
rm -rfv psmisc-23.7
mv -v psmisc-23.7.tar.xz base
ls
tar -vxf gettext-0.22.5.tar.xz 
cd gettext-0.22.5
./configure --prefix=/usr --disable-static --docdir=/usr/share/doc/gettext-0.22.5 && make && make install && chmod -v 0755 /usr/lib/preloadable_libintl.so
cd ..
rm -rfv gettext-0.22.5
mv -vf gettext-0.22.5.tar.xz base
ls
exit
exit
cd sources/
ls
tar -vxf bison-3.8.2.tar.xz 
cd bison-3.8.2
./configure --prefix=/usr --docdir=/usr/share/doc/bison-3.8.2 && make && make install
cd ..
rm -rfv bison-3.8.2
mv -v bison-3.8.2.tar.xz base
ls
tar -vxf bash-5.2.32.tar.gz 
cd bas
cd bash-5.2.32
./configure --prefix=/usr --without-bash-malloc --with-installed-readline bash_cv_strtold_broken=no --docdir=/usr/share/doc/bash-5.2.32 && make && make install && exec /usr/bin/bash --login
cd ..
rm -rfv bash-5.2.32
mv -v bash-5.2.32.tar.gz base
ls
tar -vxf libtool-2.4.7.tar.xz 
cd libtool-2.4.7
./configure --prefix=/usr && make && make install && rm -fv /usr/lib/libltdl.a
cd ..
rm -rfv libtool-2.4.7
mv -v libtool-2.4.7.tar.xz base
l
ls
tar -vxf gdbm-1.24.tar.gz 
cd gdbm-1.24
./configure --prefix=/usr --disable-static --enable-libgdbm-compat && make && make install
cd ..
rm -rfv gdbm-1.24
mv -v gdbm-1.24.tar.gz base
ls
tar -vxf gperf-3.1.tar.gz 
cd gperf-3.1
./configure --prefix=/usr --docdir=/usr/share/doc/gperf-3.1 && make && make install
cd ..
rm -rfv gperf-3.1
mv -v gperf-3.1.tar.gz base
ls
tar -vxf expat-2.6.4.tar.xz 
cd expat-2.6.4
./configure --prefix=/usr --disable-static --docdir=/usr/share/doc/expat-2.6.4 && make && make install
cd ..
rm -rfv expat-2.6.4
mv -v expat-2.6.4.tar.xz base
ls
tar -vxf inetutils-2.5.tar.xz 
cd inetutils-2.5
sed -i 's/def HAVE_TERMCAP_TGETENT/ 1/' telnet/telnet.c
./configure --prefix=/usr --bindir=/usr/bin --localstatedir=/var --disable-logger --disable-whois --disable-rcp --disable-rexec --disable-rlogin --disable-rsh --disable-servers && make && make install && mv -v /usr/{,s}bin/ifconfig
cd ..
rm -rfv inetutils-2.5
mv -v inetutils-2.5.tar.xz base
ls
tar -vxf less-661.tar.gz 
cd less-661
./configure --prefix=/usr --sysconfdir=/etc && make && make install
cd ..
rm -rfv less-661
mv -v less-661.tar.gz base
ls
find / -size +100M
tar -vxf perl-5.40.0.tar.xz 
cd perl-5.40.0
export BUILD_ZLIB=False
export BUILD_BZIP2=0
sh Configure -des                                                       -D prefix=/usr                                             -D vendorprefix=/usr                                       -D privlib=/usr/lib/perl5/5.40/core_perl                   -D archlib=/usr/lib/perl5/5.40/core_perl                   -D sitelib=/usr/lib/perl5/5.40/site_perl                   -D sitearch=/usr/lib/perl5/5.40/site_perl                  -D vendorlib=/usr/lib/perl5/5.40/vendor_perl               -D vendorarch=/usr/lib/perl5/5.40/vendor_perl              -D man1dir=/usr/share/man/man1                             -D man3dir=/usr/share/man/man3                             -D pager="/usr/bin/less -isR"                              -D useshrplib                                              -D usethreads && make && make install && unset BUILD_ZLIB BUILD_BZIP2
cd ..
rm -rfv perl-5.40.0
ls
tar -vxf XML-Parser-2.47.tar.gz 
cd XML-Parser-2.47
perl Makefile.PL && make && make install
cd ..
rm -rfv XML-Parser-2.47
mv -v perl-5.40.0.tar.xz XML-Parser-2.47.tar.gz base
ls
tar -vxf intltool-0.51.0.tar.gz 
cd intltool-0.51.0
sed -i 's:\\\${:\\\$\\{:' intltool-update.in
./configure --prefix=/usr && make && make install && install -vDm644 doc/I18N-HOWTO /usr/share/doc/intltool-0.51.0/
install -vDm644 doc/I18N-HOWTO /usr/share/doc/intltool-0.51.0
rm -fv /usr/share/doc/intltool-0.51.0 
install -vDm644 doc/I18N-HOWTO /usr/share/doc/intltool-0.51.0/I18N-HOWTO
cd ..
rm -rfv intltool-0.51.0
mv -v intltool-0.51.0.tar.gz base
ls
mv -v grep-3.11.tar.xz base
ls
exit
cd sources
ls
tar -vxf autoconf-2.72.tar.xz 
cd autoconf-2.72
./configure --prefix=/usr && make && make install
cd ..
rm -rfv autoconf-2.72
mv -v autoconf-2.72.tar.xz base
ls
tar -vxf automake-1.17.tar.xz 
cd automake-1.17
./configure --prefix=/usr --docdir=/usr/share/doc/automake-1.17 && make && make install
cd ..
rm -rfv automake-1.17
mv -v automake-1.17.tar.xz base
ls
tar -vxf openssl-3.3.2.tar.gz 
cd openssl-3.3.2
./config --prefix=/usr --openssldir=/etc/ssl --libdir=lib shared zlib-dynamic && make && sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile && make MANSUFFIX=ssl install && mv -v /usr/share/doc/openssl{,-3.3.2}
cd ..
rm -rfv openssl-3.3.2
mv -v openssl-3.3.2.tar.gz base
ls
tar -vxf kmod-33.tar.xz 
cd kmod-33
./configure --prefix=/usr --sysconfdir=/etc --with-openssl --with-xz --with-zstd --with-zlib --disable-manpages && make && make install && for target in depmod insmod modinfo modprobe rmmod ; do ln -sfv ../bin/kmod /usr/sbin/$target; rm -fv /usr/bin/$target; done
cd ..
rm -rfv kmod-33
mv -v kmod-33.tar.xz base
ls
tar -vxf elfutils-0.191.tar.bz2 
cd elfutils-0.191
./configure --prefix=/usr --disable-debuginfod --enable-libdebuginfod=dummy && make && make install
rm -fv /usr/lib/lib{elf,dw,asm}.a
cd ..
rm -rfv elfutils-0.191
mv -v elfutils-0.191.tar.bz2 base
ls
tar -vxf libffi-3.4.6.tar.gz 
cd libffi-3.4.6
./configure --prefix=/usr --disable-static --with-gcc-arch=x86-64 && make && make install
cd ..
rm -rfv libffi-3.4.6
mv -v libffi-3.4.6.tar.gz base
ls
ls extra/
mv -v udev-lfs-20230818.tar.xz extra
ls
tar -vxf Python-3.12.7.tar.xz 
cd Python-3.12.7
./configure --prefix=/usr --enable-shared --with-system-expat --enable-optimizations && make && make install
cd ..
rm -rfv Python-3.12.7
mv -v Python-3.12.7.tar.xz base
mv -v python-3.12.7-docs-html.tar.bz2 base
ls
tar -vxf flit_core-3.9.0.tar.gz 
cd flit_core-3.9.0
pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
pip3 install --no-index --no-user --find-links dist flit_core
cd ..
rm -rfv flit_core-3.9.0
mv -v flit_core-3.9.0.tar.gz base
ls
pip
find / -name pip3
ln -sv pip3 /usr/bin/pip
tar -vxf wheel-0.44.0.tar.gz 
cd wheel-0.44.0
pip wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
pip install --no-index --find-links dist wheel
cd ..
rm -rfv wheel-0.44.0
mv -v wheel-0.44.0.tar.gz base
ls
tar -vxf setuptools-72.2.0.tar.gz 
cd setuptools-72.2.0
pip wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
pip install --no-index --find-links dist setuptools
cd ..
rm -rfv setuptools-72.2.0
mv -v setuptools-72.2.0.tar.gz base
ls
tar -vxf ninja-1.12.1.tar.gz 
cd ninja-1.12.1
sed -i '/int Guess/a \
  int   j = 0;\
  char* jobs = getenv( "NINJAJOBS" );\
  if ( jobs != NULL ) j = atoi( jobs );\
  if ( j > 0 ) return j;\
' src/ninja.cc
python
ln -sv python3 /usr/bin/python
python configure.py --bootstrap
install -vm755 ninja /usr/bin
install -vDm644 misc/bash-completion /usr/share/bash-completion/completions/ninja
install -vDm644 misc/zsh-completion /usr/share/zsh/site-functions/_ninja
cd ..
rm -rfv ninja-1.12.1
mv -v ninja-1.12.1.tar.gz base
ls
tar -vxf meson-1.5.1.tar.gz 
cd meson-1.5.1
pip wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
pip install --no-index --find-links dist meson
install -vDm644 data/shell-completions/bash/meson /usr/share/bash-completion/completions/meson
install -vDm644 data/shell-completions/zsh/_meson /usr/share/zsh/site-functions/_meson
cd ..
rm -rfv meson-1.5.1
mv -v meson-1.5.1.tar.gz base
ls
tar -vxf coreutils-9.5
tar -vxf coreutils-9.5.tar.xz 
cd coreutils-9.5
patch -Np1 -i ../coreutils-9.5-i18n-2.patch 
autoreconf -fiv
FORCE_UNSAFE_CONFIGURE=1 ./configure --prefix=/usr --enable-no-install-program=kill,uptime && make && make install
cd ..
rm -rfv coreutils-9.5
mv -v coreutils-9.5* base
ls
tar -vxf check-0.15.2.tar.gz 
cd check-0.15.2
./configure --prefix=/usr --disable-static && make && make docdir=/usr/share/doc/check-0.15.2 install
cd ..
rm -rfv check-0.15.2
mv -v check-0.15.2.tar.gz 
mv -v check-0.15.2.tar.gz base
ls
tar -vxf diffutils-3.10.tar.xz 
cd diffutils-3.10
./configure --prefix=/usr && make && make install
cd ..
rm -rfv diffutils-3.10
mv -v diffutils-3.10.tar.xz base
ls
tar -vxf gawk-5.3.0.tar.xz 
cd gawk-5.3.0
sed -i 's/extras//' Makefile.in
./configure --prefix=/usr && make && rm -fv /usr/bin/gawk-5.3.0 && make install
ln -sv gawk.1 /usr/share/man/man1/awk.1
cd ..
rm -rfv gawk-5.3.0
mv -v gawk-5.3.0.tar.xz base
ls
tar -vxf findutils-4.10.0.tar.xz 
cd findutils-4.10.0
./configure --prefix=/usr --localstatedir=/var/lib/locate && make && make install
cd ..
rm -rfv findutils-4.10.0
mv -v findutils-4.10.0.tar.xz base
ls
tar -vxf groff-1.23.0.tar.gz 
cd groff-1.23.0
PAGE=letter ./configure --prefix=/usr && make && make install
cd ..
rm -rfv groff-1.23.0
mv -v groff-1.23.0.tar.gz base
ls
mv -v grub-2.12.tar.xz base
ls
tar -vxf gzip-1.13.tar.xz 
cd gzip-1.13
./configure --prefix=/usr && make && make install
cd ..
rm -rfv gzip-1.13
mv -v gzip-1.13.tar.xz base
ls
tar -vxf iproute2-6.10.0.tar.xz 
cd iproute2-6.10.0
sed -i /ARPD/d Makefile
rm -fv man/man8/arpd.8 
make NETNS_RUN_DIR=/run/netns && make SBINDIR=/usr/sbin install
cd ..
rm -rfv iproute2-6.10.0
mv -v iproute2-6.10.0.tar.xz base
ls
tar -vxf kbd-2.6.4.tar.xz 
cd kbd-2.6.4
patch -Np1 -i ../kbd-2.6.4-backspace-1.patch 
sed -i '/RESIZECONS_PROGS=/s/yes/no/' configure
sed -i 's/resizecons.8 //' docs/man/man8/Makefile.in
./configure --prefix=/usr --disable-vlock && make && make install
cd ..
rm -rfv kbd-2.6.4
mv -v kbd-2.6.4* base
ls
tar -vxf libpipeline-1.5.7.tar.gz 
cd libpipeline-1.5.7
./configure --prefix=/usr && make && make install
cd ..
rm -rfv libpipeline-1.5.7
mv -v libpipeline-1.5.7.tar.gz base
ls
tar -vxf make-4.4.1.tar.gz 
cd make-4.4.1
./configure --prefix=/usr && make && make install
cd ..
rm -rfv make-4.4.1
mv -v make-4.4.1.tar.gz base
ls
tar -vxf patch-2.7.6.tar.xz 
cd patch-2.7.6
./configure --prefix=/usr && make && make install
cd ..
rm -rfv patch-2.7.6
mv -v patch-2.7.6.tar.xz base
ls
tar -vxf tar-1.35.tar.xz 
cd tar-1.35
FORCE_UNSAFE_CONFIGURE=1 ./configure --prefix=/usr && make && make install
cd ..
rm -rfv tar-1.35
mv -v tar-1.35.tar.xz base
ls
tar -vxf texinfo-7.1.tar.xz 
cd texinfo-7.1
./configure --prefix=/usr && make && make install
cd ..
rm -rfv texinfo-7.1
mv -v texinfo-7.1.tar.xz base
ls
mv -v vim-9.1.0660.tar.gz base
ls
mv -v sysklogd-2.6.1.tar.gz extra
ls
exit
cd sources/
ls
tar -vxf nano-8.1.tar.xz 
cd nano-8.1
./configure --prefix=/usr --sysconfdir=/etc --enable-utf8 --docdir=/usr/share/doc/nano-8.1 && make && make install
nano doc/sample.nanorc
nano
nano
mv -v /etc/nano.nanorc /etc/nanorc
nano
nano /etc/nanorc
nano
nano /etc/nanorc
cd ..
rm -rfv nano-8.1
tar -vxf nano-8.1.tar.xz 
nano nano-8.1/doc/sample.nanorc.in 
nano /etc/nanorc
nano
rm -rfv nano-8.1
mv -v nano-8.1.tar.xz extra
ls
tar -vxf MarkupSafe-2.1.5.tar.gz 
cd MarkupSafe-2.1.5
pip wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
pip install --no-index --no-user --find-links dist Markupsafe
cd ..
rm -rfv MarkupSafe-2.1.5
mv -v MarkupSafe-2.1.5.tar.gz base
ls
tar -vxf jinja2-3.1.4.tar.gz 
cd jinja2-3.1.4
pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
pip install --no-index --no-user --find-links dist Jinja2
cd ..
rm -rfv jinja2-3.1.4
mv -v jinja2-3.1.4.tar.gz base
ls
tar -vxf pyelftools-0.31.tar.gz 
cd pyelftools-0.31
pip wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
pip install --no-index --no-user --find-links dist pyelftools
cd ..
rm -rfv pyelftools-0.31
mv -v pyelftools-0.31.tar.gz extra
ls
mv -v systemd-man-pages-256.4.tar.xz base
tar -vxf systemd-256.4.tar.gz 
cd systemd-256.4
sed -i -e 's/GROUP="render"/GROUP="video"/'        -e 's/GROUP="sgx", //' rules.d/50-udev-default.rules.in
mkdir -v build
cd build
cat /etc/shadow
cat /etc/passwd
nano /etc/os-release
ln -sv /etc/os-release /usr/lib/os-release
meson setup .. --prefix=/usr --buildtype=release -D mode=release -D install-tests=false -D sysusers=false -D rpmmacrosdir=no -D homed=disabled -D userdb=false -D man=disabled -D pamconfdir=no -D dev-kvm-mode=0660 -D nobody-group=nogroup -D sysupdate=disabled -D ukify=disabled -D docdir=/usr/share/doc/systemd-256.4 -D default-dnssec=yes
ninja
ninja install
tar -vxf ../../base/systemd-man-pages-256.4.tar.xz --no-same-owner --strip-components=1 -C /usr/share/man
systemctl preset-all
cd ../..
rm -rfv systemd-256.4
ls
mv -v systemd-256.4.tar.gz base
ls
tar -vxf dbus-1.14.10.tar.xz 
cd dbus-1.14.10
./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --runstatedir=/run --enable-user-session --disable-static --disable-doxygen-docs --disable-xml-docs --docdir=/usr/share/doc/dbus-1.14.10 --with-system-socket=/run/dbus/system_bus_socket && make && make install
ln -sfv /etc/machine-id /var/lib/dbus
cd ..
rm -rfv dbus-1.14.10
mv -v dbus-1.14.10.tar.xz base
ls
tar -vxf man-db-2.12.1.tar.xz 
cd man-db-2.12.1
./configure --prefix=/usr --docdir=/usr/share/doc/man-db-2.12.1 --sysconfdir=/etc --disable-setuid --enable-cache-owner=bin --with-browser=/usr/bin/links --with-vgrind=/usr/bin/vgrind --with-grap=/usr/bin/grap && make && make install
cd ..
rm -rfv man-db-2.12.1
mv -v man-db-2.12.1.tar.xz base
ls
tar -vxf procps-ng-4.0.4.tar.xz 
cd procps-ng-4.0.4
./configure --prefix=/usr --docdir=/usr/share/doc/procps-ng-4.0.4 --disable-static --disable-kill --with-systemd && make src_w_LDADD='$(LDADD) -lsystemd' && make install
cd ..
rm -rfv procps-ng-4.0.4
mv -v procps-ng-4.0.4.tar.xz base
ls
tar -vxf util-linux-2.40.2.tar.xz 
cd util-linux-2.40.2
./configure --bindir=/usr/bin --libdir=/usr/lib --runstatedir=/run --sbindir=/usr/sbin --disable-chfn-chsh --disable-login --disable-nologin --disable-su --disable-setpriv --disable-runuser --disable-pylibmount --disable-liblastlog2 --disable-static --without-python ADJTIME_PATH=/var/lib/hwclock/adjtime --docdir=/usr/share/doc/util-linux-2.40.2 && make && make install
cd ..
rm -rfv util-linux-2.40.2
mv -v util-linux-2.40.2.tar.xz base
ls
tar -vxf e2fsprogs-1.47.1.tar.gz 
cd e2fsprogs-1.47.1
mkdir build
cd build
../configure --prefix=/usr --sysconfdir=/etc --enable-elf-shlibs --disable-libblkid --disable-libuuid --disable-uuidd --disable-fsck && make && make install
rm -fv /usr/lib/lib{com_err,e2p,ext2fs,ss}.a
gunzip -v /usr/share/info/libext2fs.info.gz 
install-info --dir-file=/usr/share/info/dir /usr/share/info/libext2fs.info 
cd ../..
rm -rfv e2fsprogs-1.47.1
mv -v e2fsprogs-1.47.1.tar.gz base
ls
mv -v linux-6.11.7.tar.xz base
ls
cd ..
save_usrlib="$(cd /usr/lib; ls ld-linux*[^g])
             libc.so.6
             libthread_db.so.1
             libquadmath.so.0.0.0
             libstdc++.so.6.0.33
             libitm.so.1.0.0
             libatomic.so.1.2.0"
cd /usr/lib
for LIB in $save_usrlib; do     objcopy --only-keep-debug --compress-debug-sections=zlib $LIB $LIB.dbg;     cp $LIB /tmp/$LIB;     strip --strip-unneeded /tmp/$LIB;     objcopy --add-gnu-debuglink=$LIB.dbg /tmp/$LIB;     install -vm755 /tmp/$LIB /usr/lib;     rm /tmp/$LIB; done
online_usrbin="bash find strip"
online_usrlib="libbfd-2.43.1.so
               libsframe.so.1.0.0
               libhistory.so.8.2
               libncursesw.so.6.5
               libm.so.6
               libreadline.so.8.2
               libz.so.1.3.1
               libzstd.so.1.5.6
               $(cd /usr/lib; find libnss*.so* -type f)"
for BIN in $online_usrbin; do     cp /usr/bin/$BIN /tmp/$BIN;     strip --strip-unneeded /tmp/$BIN;     install -vm755 /tmp/$BIN /usr/bin;     rm /tmp/$BIN; done
for LIB in $online_usrlib; do     cp /usr/lib/$LIB /tmp/$LIB;     strip --strip-unneeded /tmp/$LIB;     install -vm755 /tmp/$LIB /usr/lib;     rm /tmp/$LIB; done
for i in $(find /usr/lib -type f -name \*.so* ! -name \*dbg)          $(find /usr/lib -type f -name \*.a)                          $(find /usr/{bin,sbin,libexec} -type f); do     case "$online_usrbin $online_usrlib $save_usrlib" in         *$(basename $i)* )             ;;         * ) strip --strip-unneeded $i;             ;;     esac; done
unset BIN LIB save_usrlib online_usrbin online_usrlib
cd ..
cd ..
cd tmp
ls
rm -fv cc*
rm -rfv tst-bz26353XREApA/
ls
ls -a
cd ..
find /usr/lib /usr/libexec -name \*.la -delete
find /usr -depth -name $(uname -m)-lfs-linux-gnu\* | xargs rm -rfv
userdel -r tester
ls
exit
nano BY-NC-SA-4.0.license 
nano LICENSE.md
nano LICENSE.md
nano LICENSE.md
nano
exit
