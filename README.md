# FerretOS

## LFS-Based LiveCD Image

Welcome to FerretOS! This operating system project is currently a proof-of-concept
build/release of [Linux From Scratch](https://www.linuxfromscratch.org) with some key
differences:

- GRUB has been replaced with systemd-boot
- System configuration and some package build configurations are modified to allow
as much hardware compatibility as possible
- The bootloader is configured to not pass any partition to the kernel during boot

The resulting image (should) be fully capable of booting from a DVD or USB, with no
notion of what hardware it has available or where it's booting from, and still mount
the root partition and the remaining system with no issue. Once fully booted, FerretOS
has all the tools and packages needed to build a fresh copy of Linux From Scratch (LFS)
on the machine or VM. It can also be used as a basic rescue disk for a nonresponsive
system.

### History

FerretOS was ultimately inspired by the now-defunct LFS LiveCD project! The last
update of its homepage can be found here: <https://www.linuxfromscratch.org/livecd/>.
Part of the proof-of-concept stage is simply to show that LFS can still produce a
LiveCD variant, provided there are people able to maintain it.

## Changes

#### Packages

- Update expat to 2.6.4
- Update kernel to 6.11.7
- Update openssl to 3.3.2
- Update python to 3.12.7
- Add (blfs) libidn2 2.3.7
  - Add (blfs) libunistring 1.2 as recommended dependency
- Build gmp 6.3.0 with `--disable-assembly --host=amd64-pc-linux-gnu`
- Build mpfr 4.2.1 with `--enable-decimal-float=generic`
- Build gcc 14.2.0 with `--with-arch=x86-64 --with-tune=generic`
- Install all of elfutils 0.191, then clean up all installed static libraries
  - `rm -fv /usr/lib/lib{elf,dw,asm}.a`
- Build libffi 3.4.6 with `--with-gcc-arch=x86-64`
- Skip installing GRUB (source package is available in image)
- Personal preference: skip installing vim (source package is available in image)
- Personal preference: install (blfs) nano 8.1 as editor
  - `/etc/nanorc` is made from editing and saving `doc/sample.nanorc` with the new
installation
- Install (external) pyelftools 0.31 to enable systemd-boot during configuration
  - Build instructions:
```
pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
pip3 install --no-index --no-user --find-links dist pyelftools
```
- Add (blfs) BLFS systemd units (2024-08-01)
- Add (blfs) wget 1.25.0
  - Add (blfs) libpsl 0.21.5 as recommended dependency
  - Add (blfs) make-ca 1.14 as recommended dependency
    - Add (blfs) p11-kit 0.25.5 as dependency
      - Add (blfs) libtasn1 4.19.0 as recommended dependency
- Add (blfs) openssh 9.8p1
- Add (blfs) sudo 1.9.15p5
  - To enable insults: `--with-insults`
  - To enable all insults: `--with insults --with-all-insults`
- Add (external) dracut (last commit 2024-03-21)
  - Requires asciidoc for documentation, use `--disable-documentation` to avoid
- Add (blfs) btrfs-progs 6.10.1
  - Add (blfs) lzo 2.10 as dependency
- Add (blfs) dosfstools 4.2
- Add (blfs) jfsutils 1.1.15
- Add (blfs) gptfdisk 1.0.10
  - Add (blfs) popt 1.19 as dependency
- Add (blfs) parted 3.6
- Add (blfs) sshfs 3.7.3
  - Add (blfs) fuse 3.16.2 as dependency
  - Add (blfs) glib 2.80.4 as dependency
    - Add (blfs) packaging 24.1 as dependency
    - Add (blfs) docutils 0.21.2 as recommended dependency
    - Add (blfs) libxslt 1.1.42 as recommended dependency
      - Add (blfs) libxml2 2.13.3 as dependency
        - Add (blfs) icu 75.1 as recommended dependency
      - Add (blfs) docbook-xml 4.5 as recommended dependency
        - Add (blfs) unzip 6.0 as unpack requirement
      - Add (blfs) docbook-xsl-nons 1.79.2 as recommended dependency
    - Add (blfs) pcre2 10.44 as recommended dependency
    - Add (blfs) shared-mime-info 2.4 as dependency
    - Add (blfs) desktop-file-utils 0.27 as dependency
- Add (blfs) xfsprogs 6.9.0
  - Add (blfs) inih 58 as dependency
  - Add (blfs) liburcu 0.14.0 as dependency
- Add (blfs) efivar 39
  - Add (blfs) mandoc 1.14.6 as recommended dependency
- Add (blfs) efibootmgr 18
  - `EFIDIR=ferretos`
  - `EFI_LOADER=systemd-bootx64.efi`
- Add (blfs) iso-codes 4.17.0
  - Debian has removed the previous version, so we move to the next available version
- Add (blfs) lsof 4.99.0
  - Add (blfs) libtirpc 1.3.5 as dependency
- Add (blfs) tree 2.1.3
- Add (blfs) gpm 1.20.7
- Add (blfs) gnupg 2.4.5
  - Add (blfs) libassuan 3.0.1 as dependency
    - Add (blfs) libgpg-error 1.50 as dependency
  - Add (blfs) libgcrypt 1.11.0 as dependency
  - Add (blfs) libksba 1.6.7 as dependency
  - Add (blfs) npth 1.7 as dependency
  - Add (blfs) openldap 2.6.8 as dependency
    - Add (blfs) cyrus-sasl 2.1.28 as recommended dependency
      - Problems in including `time.h` in multiple files
        - Remove `#ifdef ... #endif` from around `#include <time.h>` in `lib/saslutil.c`
        - Add `#include <time.h>` to `plugins/cram.c`
      - Add (blfs) lmdb 0.9.31 as recommended dependency
  - Add (blfs) gnutls 3.8.7.1 as recommended dependency
    - Add (blfs) nettle 3.10 as dependency
  - Add (blfs) pinentry 1.3.1 as recommended dependency
  - Add (blfs) libusb 1.0.27 as optional dependency (for building ccid driver)
- Add (blfs) hwdata 0.385
- Add (blfs) p7zip 17.04
- Add (blfs) pciutils 3.13.0
- Add (external) exfat 1.4.0
  - `./configure --prefix=/usr --enable-year2038`
- Add (blfs) usbutils 017
- Add (blfs) which 2.21
- Add (blfs) rsync 3.3.0
- Add (blfs) iw 6.9
  - Add (blfs) libnl 3.10.0
- Add (blfs) wpa-supplicant 2.11
- Add (blfs) curl 8.11.0
- Add (blfs) links 2.30
  - Add (blfs) libevent 2.1.12 as recommended dependency
- Add (blfs) libburn 1.5.6
- Add (blfs) libisofs 1.5.6
- Add (blfs) libisoburn 1.5.6
- Add (external) tmux 3.5a
- Add (external) [linux-firmware](https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/)
  - Add (external) rdfind 1.6.0 as recommended dependency
  - Package is made by packaging the git repo after checking for updates

#### Configuration

***Configuration files are made in a text editor (potentially outside chroot by
root until a text editor is available).***

- Source packages installed in LFS are in `/sources/base`
- Source packages installed in BLFS or beyond are in `/sources/extra`
- `/usr/lib64` is a symlink to `/usr/lib` to deter problems
- Mailboxes disabled for `useradd`
- Root password set
- Add `pip` as link to `pip3`
- Add `python` as link to `python3`
- `PAGE` is set to `letter`
- `/usr/lib/os-release` points to `/etc/os-release`
- Make single systemd network file to match any found network devices
  - Not sure it will enable more than one device, but it will at least enable the first
- Add `noclear.conf` from 9.10 Systemd Usage & Configuration
- Add (blfs) `/usr/sbin/strip-all.sh`
- Add (blfs) `/usr/sbin/remove-la-files.sh`
- Add `/etc/profile.d` and various shell scripts
  - Add `bash_completion.sh`
  - Add `dircolors.sh`
  - Add `extrapaths.sh`
  - Add `readline.sh`
  - Add `umask.sh`
  - Add `i18n.sh`
  - Add `pythoncerts.sh`
- Add `/etc/skel` with configuration files and FerretOS needs
  - Files copied to `/root` when finishing image
  - Add `.bash_profile`
  - Add `.bashrc`
  - Add `.bash_logout`
- Add `/etc/profile` from BLFS
- Add `/etc/bashrc` from BLFS
- Add `/etc/dircolors`
- Add `/etc/issue`
- wpa-supplicant not configured
#### Build/Configure process

- `$LFS` is any directory accessible to both root and a regular user
  - Included convenience scripts use `/opt/lfs`
  - No drives or partitions were mounted during the build stages
- git repo was set up during first build chapters
  - This has the advantage of reducing the final upload size to Github
  - This has the disadvantage of creating multiple files in Github LFS that have to be
manually pruned
- When changing ownership between users:
  - To user lfs: `chown -vR lfs:lfs $LFS`
  - To user root: `chown -vR root:root $LFS`
- To have internet access in chroot on systemd-based host systems:
  - Remove `mount -vt tmpfs tmpfs $LFS/run`
  - Use `mount -v --bind /run $LFS/run`
    - `chroot-net.sh` is already set up for this purpose
- Ownership of gcc build directory is changed before installation
  - `chown -vR root:root $PWD`
- Full `/etc/os-release` is added before systemd configure step
  - Required for systemd-boot to configure correctly
- `-D firstboot=false` is removed from systemd configuration stage
  - This image should boot anywhere, but some things can't be configured beforehand
- `-D default-dnssec=no` is removed from systemd configuration stage
- `-D ldconfig=false` is removed from systemd configuration stage
- Machine id is not initialized to avoid compiling any reference to it in later packages
- Timezone is not set to accomodate systemd-firstboot
- `/etc/adjtime` is not used to accomodate multiple hardware setups
- System locale is not set to accomodate systemd-firstboot
- Additional packages are added before building the kernel and finalizing the image
- `/etc/fstab` is not created
  - As part of the [Bootloader Specification](https://uapi-group.org/specifications/specs/boot_loader_specification/)
this file isn't needed by a spec-compliant bootloader to find the root partition or data
partitions

***If you work in a chroot and reinstall dbus via BLFS instructions, `$LFS/dev` will no
longer unmount, and the host system will require a reboot. dbus will also warn about an
invalid user account/ID. If working in a chroot prior to creating an image or USB
installation, re-initialize the machine id. It is also advised to only reinstall dbus in
the chroot if you are sure you won't need the chroot environment after exiting that
instance.***
