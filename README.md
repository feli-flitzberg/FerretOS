# FerretOS

## LFS-Based LiveCD Image

Welcome to FerretOS! This operating system project is currently a proof-of-concept build/release of [Linux From Scratch](https://www.linuxfromscratch.org) with some key differences:

- GRUB is replaced with systemd-boot
- System configuration and some package build configurations are modified to allow as much hardware compatibility as possible
- The bootloader is configured to only pass a root partition if running from disk image
  - This is due to ISO and El Torito standards for making burnable images, which generally require packing the root into a single file and mounting it onto a loop device.

The resulting image (should) be fully capable of booting from any possible boot media, with little to no notion of what hardware it has available or where it's booting from, and still mount the root partition and the remaining system with no issue.
Once fully booted, FerretOS has all the tools and packages needed to build a fresh copy of Linux From Scratch (LFS) on the machine or VM.
It can also be used as a basic rescue disk for a nonresponsive system.

### History

FerretOS was ultimately inspired by the now-defunct LFS LiveCD project!
The last update of its homepage can be found here: <https://www.linuxfromscratch.org/livecd/>.
Part of the proof-of-concept stage is simply to show that LFS can still produce a LiveCD variant, provided there are people able to maintain it.

In regards to the name, I'm in a particular Discord server for these adorable wigglers: <https://ferrets.live/>! Too cute to not name something after them.

### We would love some help!

(2024-12-18) We've managed to get everything working to boot from USB!
(dracut wasn't adding a library, for some reason.)
We're still working on making a bootable ISO, which could take a couple weeks.
If you can help speed up the process we'd love it!

### CREDITS

- omnipotentlegacy on discord helped a lot with troubleshooting some of our problems booting!

## Installation

### From the repo

If you don't want to work with the ISO file, you can install the (majority of the) contents of the repo directly, then use it to install the remaining components.
You'll need at least an 8G drive to hold everything.
We assume the drive is at `/dev/sda` for convenience.
These instructions assume gdisk, which supports all of these operations.
You will likely need to be root to run these commands.
1. Make a GUID Partition Table on the target drive.
2. Make a partition between 32M - 300M to accomodate the kernel, initrd, and bootloader. Use hex code EF00 to select the EFI partition type.
3. Make a partition between 5G - the end of the drive to hold the root system. Use hex code 8304 to select the Linux x86_64 root partition type.
  - FerretOS is currently built for a single arch (x86_64). If you cross-compile Linux from Scratch for another arch, the hex code will change.
  gdisk shows the command to list its supported types when selecting the partition type.
4. If you want partitions for other root folders (/usr and /etc have partition types in the [Discoverable Partitions Specification](https://uapi-group.org/specifications/specs/discoverable_partitions_specification/), /var might have partition types as well), add them now.
For any folder without partition types, use hex code 8300 (generic Linux partition).
5. Format the EFI partition as fat32: `mkfs.vfat -v -F 32 /dev/sda1`
6. Format the root partition as ext4: `mkfs.ext4 /dev/sda2`
  - If you prefer a different filesystem, you may need to recompile the kernel to build the FS driver into the kernel. Only the ext drivers are built in currently.
7. If you have any other partitions, format them as ext4 now.
8. Mount the root partition somewhere accessible. We'll use `/mnt` here.
9. If you have any other partitions, make the folders for them in `/mnt` and mount them to those folders now.
10. Copy the entire repo (minus .git*) into `/mnt`.
11. Mount the EFI partition to `/mnt/boot`.
12. The repo has a chroot script in `$repo/root`. Edit that script and have LFS point to `/mnt` (or wherever the target drive root is mounted).
13. Run the modified chroot script. You should now be inside your target drive.
14. Run the following commands:
```
bootctl --esp-path=/boot --entry-token=os-id --no-variables --make-machine-id-directory=no install
rm -fv /boot/loader/random-seed
kernel-install --esp-path=/boot --entry-token=os-id --make-entry-directory=yes add 6.11.7 /usr/lib/modules/6.11.7/vmlinuz
```
15. Either copy ferretos-6.11.7.conf file from `/USB-boot/loader/entries/` to `/boot/loader/entries/` or edit the file in /boot yourself:
  - dracut inserts options from the running kernel, which won't match the project's intent or needs. The only option needed is rw. You can add irqprobe if it helps your machines work.
16. Correct sudo's permissions: `chmod -v +s /usr/bin/sudo` (otherwise you won't be able to do anything once booted).
17. At this point, the FerretOS installation is complete. Memtest86+ and a conf file for it is available in USB-boot if you'd like to add it to /boot.
  - `cp -Rfv /USB-boot/memtest/ /boot/ && cp -v /USB-boot/loader/entries/memtest.conf /boot/loader/entries/`
18. Exit the chroot environment.

You can now reboot in place, or unmount ALL partitions on the target drive to boot on some other machine.
<!---
If you have something like Ventoy, the `.iso` file can be dropped directly into the USB drive with no changes. Otherwise, you have some options:
- Use any (multi)boot USB creator to burn/add the file to your USB drive.
- If you have a Blu-Ray writer, you can burn the file to disk.
- If you have a VM program, you can make a new VM and load the file as the boot media.
10. Install the bootloader: `bootctl --esp-path=/boot --entry-token=os-id --no-variables --make-machine-id-directory=no install && rm -fv /boot/loader/random-seed`
11. Install the kernel and initrd: `kernel-install --esp-path=/boot --entry-token=os-id add 6.11.7 /usr/lib/modules/6.11.7/vmlinuz`
23. Run the following xorriso command: `xorriso -as mkisofs -o ~/ferretos-1.iso -iso-level 3 -r -D --for_backup -J -joliet-long -V "FERRETOS" -P "CONFIDOWORKS" -p "<your name here>" -append_partition 2 0xef $PWD/boot.img -appended_part_as_gpt -e --interval:appended_partition_2:all:: -no-emul-boot $PWD`

O: direct them to check the command line passed to the kernel. it has to have rootwait (if we don't build it into the kernel directly), and they should remove the root line to prove our entire design.
- TODO: maybe we should make all of this a script? could be a lot of work though, especially to verify that the root node exists, has the correct partitions available, AND isn't just /dev/null or something else being passed maliciously. (you just know they'll try to blame us if they're bad actors or just dumb.)
--->

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
  - `/etc/nanorc` is made from editing and saving `doc/sample.nanorc` with the new installation
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
  - Add (blfs) cpio-2.15 as dependency
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
- Add (external) squashfs-tools 4.6.1 as ISO build dependency
  - (2024-12-05) TIL you have to turn the entire filesystem into a single file for making bootable ISOs. Dracut can handle using squashfs files if the related tools are installed.
- Add (external) memtest86+ 7.20

#### Configuration

***Configuration files are made in a text editor (potentially outside chroot by root until a text editor is available).***

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
    - Add root-specific files to `/root`: `chroot.sh`, `net-chroot.sh`
  - Add `.bash_profile`
  - Add `.bashrc`
  - Add `.bash_logout`
  - Add `Apache-2.license`
  - Add `BY-NC-SA-2.0.license`
  - Add `MIT.license`
  - Add `version-check.sh`
  - Add zipped LFS systemd book
  - Add zipped BLFS systemd book
- Add `/etc/profile` from BLFS
- Add `/etc/bashrc` from BLFS
- Add `/etc/dircolors`
- Add `/etc/issue`
- wpa-supplicant not configured
- `rootwait` command-line parameter built into kernel
  - This really only helps when booting from USB, as it forces all devices to mount first
- Kernel image copied to `/usr/lib/modules/6.11.7/vmlinuz` to avoid adding the linux source directory
- User `ferretos` added
  - Name and password match for access
  - User added to wheel group
- Clean build tree for first boot and agnostic image requirements
  - `/etc/hostname` not reset
  - Root account not reset
- Dracut configuration added at `/etc/dracut.conf.d/dracut.conf`
- Boot partition backed up to `/boot-backup`
- Sudo setuid per sudo direction

#### Build/Configure process

- `$LFS` is any directory accessible to both root and a regular user
  - Included convenience scripts use `/opt/lfs`
  - No drives or partitions were mounted during the build stages
- git repo was set up during first build chapters
  - This has the advantage of reducing the final upload size to Github
  - This has the disadvantage of creating multiple files in Github LFS that have to be manually pruned
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
  - As part of the [Bootloader Specification](https://uapi-group.org/specifications/specs/boot_loader_specification/) this file isn't needed by a spec-compliant bootloader to find the root partition or data partitions
<!--- - Boot partition is faked with mounting `boot.img` to enable ISO building with xorriso
- Contents of ISO boot partition are available at `boot-backup` and can be modified for USB booting --->

***If you work in a chroot and reinstall dbus via BLFS instructions, `$LFS/dev` will no longer unmount, and the host system will require a reboot.
dbus will also warn about an invalid user account/ID.
If working in a chroot prior to creating an image or USB installation, re-initialize the machine id.
It is also advised to only reinstall dbus in the chroot if you are sure you won't need the chroot environment after exiting that instance.***

## PRIVACY POLICY

This repository is hosted by Github.
While FerretOS does not collect or send us anything, we have enabled the Issues and Discussions features, which could collect information beyond what is submitted directly.
Github also collects information for statistics panels in the repository.
We don't control these.
Github's privacy policy is available here: <https://docs.github.com/en/site-policy/privacy-policies/github-general-privacy-statement>
