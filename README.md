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
- Build gmp with `--disable-assembly --host=amd64-pc-linux-gnu`
- Build mpfr with `--enable-decimal-float=generic`
- Build gcc with `--with-arch=x86-64 --with-tune=generic`
- Build libffi with `--with-gcc-arch=x86-64`
- Install all of elfutils, then clean up all installed static libraries
- Install (external) pyelftools to enable systemd-boot during configuration
  - Build instructions:
```
pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
pip3 install --no-index --no-user --find-links dist pyelftools
```
- Skip installing GRUB (source package is available in image)
- Personal preference: skip installing vim (source package is available in image)
- Personal preference: install (blfs) nano as editor
- Add (external) [linux-firmware](https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/)
  - Add (external) rdfind as dependency requirement

#### Configuration

***Configuration files are made in a text editor (potentially outside chroot by
root) until a text editor is available.***

- Source packages installed in LFS are in `/sources/base`
- Source packages installed in BLFS or beyond are in `/sources/extra`
- `/usr/lib64` is a symlink to `/usr/lib` to deter problems
- `LANG` is set to `en_US.UTF-8`
- Timezone not configured to avoid assumptions
- Mailboxes disabled for `useradd`
- Root password set
- `PAGE` is set to `letter`
- `/etc/os-release` is required before configuring systemd for bootloader
  - `/usr/lib/os-release` points to `/etc/os-release`
```
NAME="FerretOS"
ID="ferretos"
ID_LIKE="lfs"
PRETTY_NAME="FerretOS 1 (Solver)"
VERSION="1"
VERSION_ID="1"
VERSION_CODENAME="Solver"
HOME_URL="https://feli-flitzberg.github.io/ferretos.html"
DOCUMENTATION_URL="https://feli-flitzberg.github.io/ferretos.html"
SUPPORT_URL="https://github.com/feli-flitzberg/FerretOS/discussions"
BUG_REPORT_URL="https://github.com/feli-flitzberg/FerretOS/issues"
PRIVACY_POLICY_URL="https://feli-flitzberg.github.io/ferretos.html"
DEFAULT_HOSTNAME="solver"
ARCHITECTURE="x86-64"
```
- Single network file that should match any network card found by systemd
```
# 10-base.network
[Match]
Name=*

[Network]
DHCP=yes
UseDomains=true
```

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
- `noclear.conf` is added
- `/etc/fstab` is not created
  - As part of the [Bootloader Specification](https://uapi-group.org/specifications/specs/boot_loader_specification/)
this file isn't needed by a spec-compliant bootloader to find root
- `/etc/machine-id` is edited to change the string to `uninitialized\n` before finalizing
image
  - ***If you work in a chroot and reinstall dbus via BLFS instructions, `$LFS/dev` will no
longer unmount, and the host system will require a reboot. dbus will also warn about an
invalid user account/ID. If working in a chroot prior to creating an image or USB
installation, re-initialize the machine id. It is also advised to only reinstall dbus in
the chroot if you are sure you won't need the chroot environment after exiting that
instance.***

<!---  - For efibootmgr, the executable name is `systemd-bootx64.efi`
-- root password set
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
-- add packages listed below before setting up boot
