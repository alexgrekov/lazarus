## Lazarus Project

You are far from the server.
The server is dead (no ping, looks like OS can not boot.
There is engineer near the server who can put the USB stick into it.
Engineer can reboot the server.
You have access to the server network (ssh to another server in the LAN).
You have DHCP server in the network.

This is patcher for Debian Distro to make it easy-to-install without any promt and monitor connection to server.

Root password for ssh user is `hjgewkuoiwoincworn`

### Usage

It works on my Debian 12. Havent tested nowhere else.

1. Clone the repo and cd into it
2. Download official netinst iso from Debian Project to folder `input`
3. Run script `./bin/rebuild.sh` - from repo root
   It will download packages - such as htop, p7zip etc, unpack iso, modify the initramfs, and pack it back.
4. Write image to USB stick `sudo dd if=out-debian-netinst.iso of=/dev/sdX bs=4M`
5. ???
6. Put USB flash into server and reboot it
   If BIOS is set up to load from USB - and if it does it - you can check you DHCP server or scan network with nmap. If you get lucky and server found:
     Try to connect it with password above.

Good luck!

P.S. project is not finished yet, yu still cannot install Debian from it - but you can get access to server and take your data from it. May be - repare bootloader.
