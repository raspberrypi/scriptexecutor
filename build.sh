#!/bin/sh

BUILDROOT=buildroot-2019.11.1
# Supported targets: cm1, cm3, cmhybrid (supports both)
TARGET=cmhybrid

#
# Extract the tarball containing the unmodified buildroot version 
#
if [ ! -e $BUILDROOT ]; then
    tar xzf $BUILDROOT.tar.gz
fi

#
# Tell buildroot we have extra files in our external directory
# and use our scriptexecute_defconfig configuration file 
#
if [ ! -e $BUILDROOT/.config ]; then
    make -C $BUILDROOT BR2_EXTERNAL="$PWD/scriptexecute" scriptexecute_${TARGET}_defconfig
fi

#
# Build everything
#
make -C $BUILDROOT

#
# Copy the files we are interested in from buildroot's "output/images" directory
# to our "output" directory in top level directory 
#

# initramfs file build by buildroot containing the root file system
cp $BUILDROOT/output/images/rootfs.cpio.gz output/scriptexecute.img
# Linux kernel
cp $BUILDROOT/output/images/zImage output/kernel.img
# Raspberry Pi firmware files
cp $BUILDROOT/output/images/rpi-firmware/*.elf output
cp $BUILDROOT/output/images/rpi-firmware/*.dat output
cp $BUILDROOT/output/images/rpi-firmware/bootcode.bin output
cp $BUILDROOT/output/images/*.dtb output

# Uncomment if using dwc2
mkdir -p output/overlays
mv output/dwc2-overlay.dtb output/overlays/dwc2.dtbo

echo
echo Build complete. Files are in output folder.
echo
