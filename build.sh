#!/bin/bash


OPENSBI_PATH=`pwd`/../opensbi/build/platform/generic/firmware/fw_dynamic.bin

u () {
        #make ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- qemu-riscv64_spl_defconfig
        #make ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- nanhuv3a_defconfig
        make ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- OPENSBI=$OPENSBI_PATH -j200
        cp spl/u-boot-spl.bin spl.bin
        truncate -s65536 spl.bin
        #truncate -s2097152 spl.bin
        cat u-boot.itb >> spl.bin
}
$1
