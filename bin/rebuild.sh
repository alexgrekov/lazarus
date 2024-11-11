#!/bin/bash

# todo: make better

bin/00-clean.sh
bin/01-prepare.sh
bin/02-unpack-initrd.sh
bin/03-patch-initrd.sh
bin/06-patch-boot.sh
bin/09-pack-initrd-and-fix-md5.sh
bin/10-comppile-new-iso.sh
