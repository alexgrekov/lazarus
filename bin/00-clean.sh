#!/bin/bash

echo "";
echo "####################################### CLEAN";
echo "";

echo " rm -rf _*";
sudo rm -rf _*;
echo " rm -rf _*";
sudo rm out-debian-netinst.iso -f;

echo "clean finished";
