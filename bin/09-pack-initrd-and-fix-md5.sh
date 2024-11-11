#!/bin/bash

gzip _iso/install.amd/initrd;
cd _iso;
find -follow -type f ! -name md5sum.txt -print0 | xargs -0 md5sum > md5sum.txt;
cd ..;


