#!/bin/bash

genisoimage -r -J -b isolinux/isolinux.bin -c isolinux/boot.cat \
	-no-emul-boot -boot-load-size 4 -boot-info-table \
	-o out-debian-netinst.iso _iso
