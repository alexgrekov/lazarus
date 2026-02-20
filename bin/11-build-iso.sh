#!/bin/bash

#genisoimage -r -J -b isolinux/isolinux.bin -c isolinux/boot.cat \
#	-no-emul-boot -boot-load-size 4 -boot-info-table \
#	-o out-debian-netinst.iso _iso


xorriso -as mkisofs \
  -o out-debian-netinst.iso \
  -isohybrid-mbr isohdpfx.bin \
  -c isolinux/boot.cat \
  -b isolinux/isolinux.bin \
  -no-emul-boot \
  -boot-load-size 4 \
  -boot-info-table \
  -eltorito-alt-boot \
  -e boot/grub/efi.img \
  -no-emul-boot \
  -isohybrid-gpt-basdat \
  -V "Debian 12.7.0 amd64 n" \
  _iso/
