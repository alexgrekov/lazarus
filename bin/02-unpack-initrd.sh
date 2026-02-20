#!/bin/bash

echo "";
echo "####################################### UNPACK";
echo "";

isoName=`bin/getDebianInstallSrcImage.sh`;
echo "isoImage = $isoName";

echo "--- 7z x -o_iso $isoName";
7z x -o_iso $isoName

echo "--- gunzip _iso/install.amd/initrd.gz";
gunzip _iso/install.amd/initrd.gz

echo "unpack finished";
