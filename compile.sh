KERNEL_NAME=$1
TARGET_DIR=~/stuff/compiler
export CROSS_COMPILE=~/stuff/tc/arm-cortex_a15-linux-gnueabihf-linaro_4.9.1-2014.06/bin/arm-eabi-
export ARCH=arm

make yukon_tianchi_dsds_defconfig
make -j10
rm $TARGET_DIR/zImage-kk $TARGET_DIR/dt-kk.img
cp arch/arm/boot/zImage $TARGET_DIR/zImage-kk
cd $TARGET_DIR
./generate_dt.sh
. makeit.sh $KERNEL_NAME
echo PRODUCT :- $(pwd)/$KERNEL_NAME.img
