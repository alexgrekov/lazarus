#!/bin/bash

echo "";
echo "####################################### PATCH";
echo "";

echo "--- cd binaries";
cd _binaries;

echo "--- for files";
for i in $(find -type f); do 
  echo "   Installing $i...";
  echo "$i" | cpio -H newc -o -A -F ../_iso/install.amd/initrd
done;
cd ..;
echo "patch finished";
