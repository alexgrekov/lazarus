#!/bin/bash

echo "";
echo "####################################### PATCH BOOT";
echo "";

echo "sed 's|default vesamenu.c32|default install|g' --in-place _iso/isolinux/isolinux.cfg";

sed 's|default vesamenu.c32|default install|g' --in-place _iso/isolinux/isolinux.cfg

echo "Patching boot/grub/grub.cfg";

echo "sed \"s|^insmod|set default='Install'\\ninsmod|\" --in-place _iso/boot/grub/grub.cfg;";
sed "s|^insmod|set default='Install'\ninsmod|" --in-place _iso/boot/grub/grub.cfg;

echo "sed \"s|^insmod|set timeout=3\\ninsmod|\" --in-place _iso/boot/grub/grub.cfg;";
sed "s|^insmod|set timeout=3\ninsmod|" --in-place _iso/boot/grub/grub.cfg;

echo "boot patch finished";
