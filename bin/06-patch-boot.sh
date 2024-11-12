#!/bin/bash
sed '/Graphical install/,+4d' --in-place _iso/boot/grub/grub.cfg
sed 's|default vesamenu.c32|default install|g' --in-place _iso/isolinux/isolinux.cfg

