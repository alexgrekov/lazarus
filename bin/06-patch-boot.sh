#!/bin/bash

echo "";
echo "####################################### PATCH BOOT";
echo "";

echo "sed 's|default vesamenu.c32|default install|g' --in-place _iso/isolinux/isolinux.cfg";

sed 's|default vesamenu.c32|default install|g' --in-place _iso/isolinux/isolinux.cfg

echo "boot patch finished";
