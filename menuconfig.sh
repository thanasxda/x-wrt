#!/bin/bash

######
yellow="\033[1;93m"
magenta="\033[05;1;95m"
restore="\033[0m"

######
defconfig=xiaomi_defconfig
rm -rf .config
rm -rf .config.old
cp $defconfig .config

######
path=/usr/bin
path2=/usr/lib/llvm-11/bin
#xpath=~/TOOLCHAIN/clang/bin
export LD_LIBRARY_PATH=""$path2"/../lib:"$path2"/../lib64:$LD_LIBRARY_PATH"
export PATH=""$path2":$PATH"
CLANG="CC=$path/clang
        HOSTCC=$path/clang"
LD="LD=$path2/ld.lld"
make $CLANG $LD menuconfig
cp .config $defconfig

######
clear
echo -e "${yellow}"
echo KERNEL DEFCONFIG REGENERATED
echo -e "${restore}"

###### END
