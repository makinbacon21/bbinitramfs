Busybox InitramFS for Tegra devices
===================================
This repository contains a simple initramfs system that will mount and boot a loopback image on the storage image. It allows anyone to boot Linux on retail NVIDIA Tegra devices (SHIELD, TegraNote) without messing with the partitions. Just create an image file with your root filesystem and modify the `init` script so that it mounts it. In the `init` script, `/roothost/media/0/` corresponds to the `/sdcard` directory for the main Android user.

Usage
-----
First, built the ramdisk file by issuing `make`. This will create a `ramdisk.img.gz` file, which is image file you want to boot on. Pass it to your bootloader (typically by doing `fastboot boot zImage ramdisk.img.gz`) and make sure your kernel command line has the `initrd=0x82000000,0x800000` parameter. The `init` script at the root of the filesystem will be executed, it should find and mount your root filesystem image and boot it.

Feedback and contact
--------------------
Alexandre Courbot <gnurou@gmail.com>

Source release
--------------
This binary release uses an unmodified version of Busybox, which source code can be downloaded at https://github.com/Gnurou/busybox.
