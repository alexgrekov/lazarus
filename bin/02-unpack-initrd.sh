#!/bin/bash

count=`ls input/*.iso | wc -l`;
isoName=`ls input/*.iso`;

if [[ "$count" == '1' ]]; then
    echo "Found 1 image in folder";
else
    echo "ERROR: make folder input and place there debian image.";
    exit 1;
fi

7z x -o_iso $isoName
gunzip _iso/install.amd/initrd.gz

