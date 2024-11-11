#!/bin/bash

cd _binaries;

for i in $(find -type f); do 
  echo "Installing $i...";
  echo "$i" | cpio -H newc -o -A -F ../_iso/install.amd/initrd
done;
cd ..;
