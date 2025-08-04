ramfs.img.gz:
	find . ! -iname README.md ! -iname LICENSE ! -iname Makefile ! -iname $@ |grep -v "\\.git*" |cpio -o --format=newc |gzip -c - > $@
	mkimage -A arm64 -O linux -T ramdisk -C gzip -d ramfs.img.gz initramfs
