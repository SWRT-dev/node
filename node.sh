#!/bin/bash

export CFLAGS="-I $PWD/opt/cross/aarch64-linux-musl/aarch64-linux-musl/include -static"
export CXXFLAGS="-I $PWD/opt/cross/aarch64-linux-musl/aarch64-linux-musl/include -static"
export CC=$PWD/opt/cross/aarch64-linux-musl/bin/aarch64-linux-musl-gcc
export CXX=$PWD/opt/cross/aarch64-linux-musl/bin/aarch64-linux-musl-g++
export CORSS_PREFIX=$PWD/opt/cross/aarch64-linux-musl/bin/aarch64-linux-musl-
export AR="${CORSS_PREFIX}ar"
export RANLIB="${CORSS_PREFIX}ranlib"
export LD="${CORSS_PREFIX}ld"
export LINK="${CXX}"
export CC_host="gcc"
export CXX_host="g++"
export AR_host="ar"
export RANLIB_host="ranlib"
export LINK_host="${CXX_host}"
export LD_host="ld"
export CC_HOST="gcc"
export CXX_HOST="g++"
export AR_HOST="ar"
export RANLIB_hHOST="ranlib"
export LINK_HOST="${CXX_HOST}"
export LD_HOST="ld"
#wget https://nodejs.org/dist/v16.16.0/node-v16.16.0.tar.gz
[ ! -d "node-v16.16.0" ] && tar zxvf node-v16.16.0.tar.gz
cd node-v16.16.0
sed -i "s/'-static'/'-static', '-Wl,--whole-archive', '-lpthread', '-Wl,--no-whole-archive'/" configure.py
./configure --dest-cpu=arm64 --dest-os=linux --fully-static --without-snapshot --with-intl=none --prefix=/jffs/softcenter --cross-compiling --with-arm-fpu=neon


make -j16
