#!/bin/bash

echo "";
echo "####################################### PREPARE";
echo "";

echo "--- apt install ...";

sudo apt install xorriso p7zip-full ssh htop genisoimage -y;

echo "--- mkdir _binaries && cd in";

mkdir _binaries;
cd _binaries;

echo "--- cp preceed and make folders";

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

echo "--- sshkeygen";

ssh-keygen -A -f .

mv etc/ssh/* lib/x86_64-linux-gnu/.;


echo "--- inject sshd";

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

echo "--- inject bash";
#### BASH
s /bin/bash
#  /lib ldd /bin/bash | awk '{print "s " $3}' 
s /lib/x86_64-linux-gnu/libtinfo.so.6
s /lib/x86_64-linux-gnu/libc.so.6
################################################

echo "--- inject htop";
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

echo "--- inject cfdisk";
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

echo "--- inject lsblk";
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

echo "--- inject vim";
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

echo "--- cd .. and mkdir _iso";
cd ..;

mkdir _iso;

echo "prepare finished";
