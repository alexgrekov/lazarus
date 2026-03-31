#!/bin/bash

echo "";
echo "####################################### MAGIC STEP TO GEN ISO";
echo "";

echo "--- get iso image...";

debianIso=`bin/getDebianInstallSrcImage.sh`;

echo "dd if=\"$debianIso\" bs=1 count=432 of=isohdpfx.bin";

dd if="$debianIso" bs=1 count=432 of=isohdpfx.bin;

#echo "--- xorriso ...";
#xorriso -as mkisofs -o out-debian-netinst.iso \
#-isohybrid-mbr isohdpfx.bin \
#-c isolinux/boot.cat -b isolinux/isolinux.bin \
#-no-emul-boot -boot-load-size 4 -boot-info-table ./_iso
#
#echo "sudo rm -rf isohdpfx.bin";
#sudo rm -rf isohdpfx.bin;

echo "magic finished";
