#!/bin/bash

sudo apt install p7zip ssh htop genisoimage -y;

mkdir _binaries;
cd _binaries;

cp ../etc/preseed.cfg .

mkdir etc/ssh -p;
mkdir usr/sbin -p;
mkdir usr/bin -p;
mkdir bin -p;
mkdir lib/x86_64-linux-gnu -p;
mkdir lib/debian-installer.d -p;

function s() {
    name="$1";
    locName=`echo "$name" | sed 's|/||'`;
    cp "$name" "$locName";
}

cp ../lib/S* ./lib/debian-installer.d/.
cp ../etc/ssh/sshd_config ./etc/ssh/.
ssh-keygen -A -f .

mv etc/ssh/* lib/x86_64-linux-gnu/.;

#### SSHD
s /usr/sbin/sshd
#  /lib ldd /usr/sbin/sshd | awk '{print "s " $3}' 
s /lib/x86_64-linux-gnu/libcrypt.so.1
s /lib/x86_64-linux-gnu/libwrap.so.0
s /lib/x86_64-linux-gnu/libaudit.so.1
s /lib/x86_64-linux-gnu/libpam.so.0
s /lib/x86_64-linux-gnu/libsystemd.so.0
s /lib/x86_64-linux-gnu/libselinux.so.1
s /lib/x86_64-linux-gnu/libgssapi_krb5.so.2
s /lib/x86_64-linux-gnu/libkrb5.so.3
s /lib/x86_64-linux-gnu/libcom_err.so.2
s /lib/x86_64-linux-gnu/libcrypto.so.3
s /lib/x86_64-linux-gnu/libz.so.1
s /lib/x86_64-linux-gnu/libc.so.6
s /lib/x86_64-linux-gnu/libnsl.so.2
s /lib/x86_64-linux-gnu/libcap-ng.so.0
s /lib/x86_64-linux-gnu/libcap.so.2
s /lib/x86_64-linux-gnu/libgcrypt.so.20
s /lib/x86_64-linux-gnu/liblzma.so.5
s /lib/x86_64-linux-gnu/libzstd.so.1
s /lib/x86_64-linux-gnu/liblz4.so.1
 
s /lib/x86_64-linux-gnu/libpcre2-8.so.0
s /lib/x86_64-linux-gnu/libk5crypto.so.3
s /lib/x86_64-linux-gnu/libkrb5support.so.0
s /lib/x86_64-linux-gnu/libkeyutils.so.1
s /lib/x86_64-linux-gnu/libresolv.so.2
s /lib/x86_64-linux-gnu/libtirpc.so.3
s /lib/x86_64-linux-gnu/libgpg-error.so.0
################################################

#### BASH
s /bin/bash
#  /lib ldd /bin/bash | awk '{print "s " $3}' 
s /lib/x86_64-linux-gnu/libtinfo.so.6
s /lib/x86_64-linux-gnu/libc.so.6
################################################


#### HTOP
s /usr/bin/htop
#s linux-vdso.so.1
s /lib/x86_64-linux-gnu/libncursesw.so.6
s /lib/x86_64-linux-gnu/libtinfo.so.6
s /lib/x86_64-linux-gnu/libm.so.6
s /lib/x86_64-linux-gnu/libnl-3.so.200
s /lib/x86_64-linux-gnu/libnl-genl-3.so.200
s /lib/x86_64-linux-gnu/libc.so.6
################################################

#### CFDISK
s /usr/sbin/cfdisk
# ldd /usr/sbin/cfdisk | awk '{print "s " $3}' 
s /lib/x86_64-linux-gnu/libsmartcols.so.1
s /lib/x86_64-linux-gnu/libfdisk.so.1
s /lib/x86_64-linux-gnu/libmount.so.1
s /lib/x86_64-linux-gnu/libncursesw.so.6
s /lib/x86_64-linux-gnu/libtinfo.so.6
s /lib/x86_64-linux-gnu/libc.so.6

s /lib/x86_64-linux-gnu/libuuid.so.1
s /lib/x86_64-linux-gnu/libblkid.so.1
s /lib/x86_64-linux-gnu/libselinux.so.1
s /lib/x86_64-linux-gnu/libpcre2-8.so.0
################################################

#### LSBLK
s /usr/bin/lsblk
# ldd /usr/bin/lsblk | awk '{print "s " $3}' 
s /lib/x86_64-linux-gnu/libblkid.so.1
s /lib/x86_64-linux-gnu/libmount.so.1
s /lib/x86_64-linux-gnu/libsmartcols.so.1
s /lib/x86_64-linux-gnu/libudev.so.1
s /lib/x86_64-linux-gnu/libc.so.6

s /lib/x86_64-linux-gnu/libselinux.so.1
s /lib/x86_64-linux-gnu/libpcre2-8.so.0
################################################

#### VIM
s /usr/bin/vim
# ldd /usr/bin/vim | awk '{print "s " $3}' 
s /lib/x86_64-linux-gnu/libm.so.6
s /lib/x86_64-linux-gnu/libtinfo.so.6
s /lib/x86_64-linux-gnu/libselinux.so.1
s /lib/x86_64-linux-gnu/libsodium.so.23
s /lib/x86_64-linux-gnu/libacl.so.1
s /lib/x86_64-linux-gnu/libgpm.so.2
s /lib/x86_64-linux-gnu/libc.so.6
s /lib/x86_64-linux-gnu/libpcre2-8.so.0
s /lib/x86_64-linux-gnu/libpthread.so.0
################################################


cd ..;

mkdir _iso;



