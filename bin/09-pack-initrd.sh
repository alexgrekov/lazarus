#!/bin/bash

echo "";
echo "####################################### PACK";
echo "";


echo "--- gzip initrd";

gzip _iso/install.amd/initrd;
cd _iso;
echo "--- in iso - find and gen md5sum";

find -follow -type f ! -name md5sum.txt -print0 | xargs -0 md5sum > md5sum.txt;

cd ..;

echo "pack finished";
