#!/bin/bash
sed '/Graphical install/,+4d' --in-place _iso/boot/grub/grub.cfg

