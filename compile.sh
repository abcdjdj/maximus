TARGET_DIR=~/stuff/compiler
export CROSS_COMPILE=~/stuff/tc/arm-cortex_a15-linux-gnueabihf-linaro_4.9.1-2014.06/bin/arm-eabi-
export ARCH=arm

make tianchi_dual_defconfig
make -j10
cp arch/arm/boot/zImage $TARGET_DIR
