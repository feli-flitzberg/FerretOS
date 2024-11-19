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
- Add (external) [linux-firmware](https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/)
  - Add (external) rdfind as dependency requirement

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
- `/etc/fstab` is not created
  - As part of the [Bootloader Specification](https://uapi-group.org/specifications/specs/boot_loader_specification/)
this file isn't needed by a spec-compliant bootloader to find the root
partition or data partitions

***If you work in a chroot and reinstall dbus via BLFS instructions, `$LFS/dev` will no
longer unmount, and the host system will require a reboot. dbus will also warn about an
invalid user account/ID. If working in a chroot prior to creating an image or USB
installation, re-initialize the machine id. It is also advised to only reinstall dbus in
the chroot if you are sure you won't need the chroot environment after exiting that
instance.***

<!---  - For efibootmgr, the executable name is `systemd-bootx64.efi`
-- add strip-all.sh
-- add remove-la-files.sh
-- add rpm2cpio script
-- add initramfs scripts
-- set up /etc/skel before adding user
-- include starting scripts and LFS books in /etc/skel
-- include license files in /etc/skel
-- add user
--- ferretos
--- ferretos
--->
