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
cd sources
ls
tar -vxf gcc-14.2.0.tar.xz 
cd gcc-14.2.0
sed -e '/m64=/s/lib64/lib/' -i.orig gcc/config/i386/t-linux64
mkdir build
cd build
../configure --prefix=/usr LD=ld --enable-languages=c,c++ --enable-default-pie --enable-default-ssp --enable-host-pie --disable-multilib --disable-bootstrap --disable-fixincludes --with-system-zlib --with-arch=x86-64 --with-tune=generic
make && ulimit -s -H unlimited && sed -e '/cpython/d' -i ../gcc/testsuite/gcc.dg/plugin/plugin.exp && sed -e 's/no-pic /&-no-pie /' -i ../gcc/testsuite/gcc.target/i386/pr113689-1.c && sed -e 's/300000/(1|300000)/' -i ../libgomp/testsuite/libgomp.c-c++-common/pr109062.c && sed -e 's/{ target nonpic } //' -e '/GOTPCREL/d' -i ../gcc/testsuite/gcc.target/i386/fentryname3.c && chown -R tester . && su tester -c "PATH=$PATH make -k check"
../contrib/test_summary | grep -A7 Summ
chown -R root:root .
make install
ln -svr /usr/bin/cpp /usr/lib
ln -sv gcc.1 /usr/share/man/man1/cc.1
ln -sfv ../../libexec/gcc/$(gcc -dumpmachine)/14.2.0/liblto_plugin.so /usr/lib/bfd-plugins/
echo 'int main(){}' > dummy.c
cc dummy.c -v -Wl,--verbose &> dummy.log
readelf -l a.out | grep ': /lib'
grep -E -o '/usr/lib.*/S?crt[1in].*succeeded' dummy.log
grep -B4 '^ /usr/include' dummy.log
grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g'
grep "/lib.*/libc.so.6 " dummy.log
grep found dummy.log
mkdir -pv /usr/share/gdb/auto-load/usr/lib
mv -v /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib
cd ../..
rm -rfv gcc-14.2.0
exit
cd sources
tar -vxf ncurses-6.5.tar.gz 
cd ncurses-6.5
./configure --prefix=/usr --mandir=/usr/share/man --with-shared --without-debug --without-normal --with-cxx-shared --enable-pc-files --with-pkg-config-libdir=/usr/lib/pkgconfig && make && make DESTDIR=$PWD/dest install
install -vm755 dest/usr/lib/libncursesw.so.6.5 /usr/lib
rm -v dest/usr/lib/libncursesw.so.6.5 
sed -e 's/^#if.*XOPEN.*$/#if 1/' -i dest/usr/include/curses.h 
cp -av dest/* /
for lib in ncurses form panel menu ; do ln -sfv lib${lib}w.so /usr/lib/lib${lib}.so; ln -sfv ${lib}w.pc /usr/lib/pkgconfig/${lib}.pc; done
ln -sfv libncursesw.so /usr/lib/libcurses.so
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
