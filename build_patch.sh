#!/bin/bash
cd u-boot-2016.05_release
make distclean
cd ../
if [ $1 == "diff" ]
then
    diff -urN u-boot-2016.05_release u-boot-2016.05_base >u-boot-2016.05.patch
    echo "diff u-boot and output patch"
fi
