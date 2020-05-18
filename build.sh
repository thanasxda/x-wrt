#!/bin/bash

######
yellow="\033[1;93m"
magenta="\033[05;1;95m"
restore="\033[0m"

######
source="$(pwd)"
defconfig=xiaomi_defconfig

######
export USE_CCACHE=1
export USE_PREBUILT_CACHE=1
export PREBUILT_CACHE_DIR=~/.ccache
export CCACHE_DIR=~/.ccache
ccache -M 30G

######
##export CROSS_COMPILE=/usr/-linux-gnu-
#path=/usr/bin
#path2=/usr/lib/llvm-11/bin
#xpath=~/TOOLCHAIN/clang/bin

###
#export LD_LIBRARY_PATH=""$path2"/../lib:"$path2"/../lib64:$LD_LIBRARY_PATH"
#export PATH=""$path2":$PATH"
#CLANG="CC=$path/clang
#        HOSTCC=$path/clang"
        #AR=$path2/llvm-ar
        #NM=$path2/llvm-nm
        #OBJCOPY=$path2/llvm-objcopy
        #OBJDUMP=$path2/llvm-objdump
        #READELF=$path2/llvm-readelf
        #OBJSIZE=$path2/llvm-size
        #STRIP=$path2/llvm-strip
        #LD=$path2/ld.lld"

###
#CLANG="CC=clang
#        HOSTCC=clang
#        NM=llvm-nm
#        OBJCOPY=llvm-objcopy
#        OBJDUMP=llvm-objdump
#        READELF=llvm-readelf
#        OBJSIZE=llvm-size
#        STRIP=llvm-strip"

###
#LD="LD=$path2/ld.lld"

###
#VERBOSE="V=1"
THREADS=-j$(nproc --all)

######
rm -rf .config
rm -rf .config.old
cp $defconfig .config

######
make $THREADS $VERBOSE $CLANG $LD

######
