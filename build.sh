#!/bin/bash

#ARCH=arm64
#ARCH=arm
ARCH=mips
#ARCH=mipsle
PWD=$(pwd)
#prefix asuswrt:/jffs/softcenter,openwrt:/usr

if [ "$ARCH" = "arm" ];then
#armv7l
export CFLAGS="-I $PWD/../opt/cross/arm-linux-musleabi/arm-linux-musleabi/include"
export CXXFLAGS="-I $PWD/../opt/cross/arm-linux-musleabi/arm-linux-musleabi/include"
export CC=$PWD/../opt/cross/arm-linux-musleabi/bin/arm-linux-musleabi-gcc
export CXX=$PWD/../opt/cross/arm-linux-musleabi/bin/arm-linux-musleabi-g++
./configure --dest-cpu=arm --dest-os=linux --fully-static --with-arm-fpu=vfpv3 --without-snapshot --with-intl=none --prefix=/jffs/softcenter
elif [ "$ARCH" = "arm64" ];then
export CFLAGS="-I $PWD/../opt/cross/aarch64-linux-musleabi/aarch64-linux-musleabi/include"
export CXXFLAGS="-I $PWD/../opt/cross/aarch64-linux-musleabi/aarch64-linux-musleabi/include"
export CC=$PWD/../opt/cross/aarch64-linux-musleabi/bin/aarch64-linux-musleabi-gcc
export CXX=$PWD/../opt/cross/aarch64-linux-musleabi/bin/aarch64-linux-musleabi-g++
./configure --dest-cpu=arm64 --dest-os=linux --fully-static --with-arm-fpu=vfpv3 --without-snapshot --with-intl=none --prefix=/jffs/softcenter
elif [ "$ARCH" = "mips" ];then
#mips
export CFLAGS="-I $PWD/../opt/cross/mips-linux-musl/mips-linux-musl/include"
export CXXFLAGS="-I $PWD/../opt/cross/mips-linux-musl/mips-linux-musl/include"
export CC=$PWD/../opt/cross/mips-linux-musl/bin/mips-linux-musl-gcc
export CXX=$PWD/../opt/cross/mips-linux-musl/bin/mips-linux-musl-g++
./configure --dest-cpu=mips --dest-os=linux --fully-static --without-snapshot --with-intl=none --prefix=/jffs/softcenter
elif [ "$ARCH" = "mipsle" ];then
export CFLAGS="-I $PWD/../opt/cross/mipsel-linux-musl/mipsel-linux-musl/include"
export CXXFLAGS="-I $PWD/../opt/cross/mipsel-linux-musl/mipsel-linux-musl/include"
export CC=$PWD/../opt/cross/mipsel-linux-musl/bin/mipsel-linux-musl-gcc
export CXX=$PWD/../opt/cross/mipsel-linux-musl/bin/mipsel-linux-musl-g++
./configure --dest-cpu=mipsel --dest-os=linux --fully-static --without-snapshot --with-intl=none --prefix=/jffs/softcenter
fi

make -j8
mkdir -p bin/$ARCH
cp -rf out/Release/node bin/$ARCH

