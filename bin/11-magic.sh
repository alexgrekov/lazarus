#!/bin/bash

dd if=input/debian-12.7.0-amd64-netinst.iso bs=1 count=432 of=isohdpfx.bin

xorriso -as mkisofs -o out-debian-netinst.iso \
-isohybrid-mbr isohdpfx.bin \
-c isolinux/boot.cat -b isolinux/isolinux.bin \
-no-emul-boot -boot-load-size 4 -boot-info-table ./_iso

sudo rm -rf isohdpfx.bin
