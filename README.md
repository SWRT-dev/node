1.build toolchain
Edit config.sh and uncomment ARCH=mips and change CC_BASE_PREFIX to the directory where the cross compiler and related files will be stored.
Now just do ./build.sh and if all goes well, it should automatically pull down all the needed sources and build the cross compiler. This will take awhile.
2.build node
Edit build.sh
Copy build.sh to node folder
Now just do ./build.sh

