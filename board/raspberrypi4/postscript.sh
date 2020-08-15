#!/bin/sh

set -e

RPI_FW_DIR=${TARGET}/../images/rpi-firmware

cp ${BOARD_DIR}/config.txt ${BOOT_DIR}
cp ${BOARD_DIR}/cmdline.txt ${BOOT_DIR}
cp ${BOARD_DIR}/initrd.gz ${BOOT_DIR}
cp ${IMG_DIR}/zImage ${BOOT_DIR}/kernel.img
cp ${IMG_DIR}/bcm2711-rpi-4-b.dtb ${BOOT_DIR}
cp ${RPI_FW_DIR}/bootcode.bin ${BOOT_DIR}
cp ${RPI_FW_DIR}/start4.elf ${BOOT_DIR}
cp ${RPI_FW_DIR}/fixup4.dat ${BOOT_DIR}

# copy overlays
mkdir -p ${BOOT_DIR}/overlays
cp ${RPI_FW_DIR}/overlays/*.dtbo ${BOOT_DIR}/overlays
