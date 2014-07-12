KERNEL_NAME=$1
TARGET_DIR=~/stuff/compiler
export CROSS_COMPILE=~/stuff/tc/arm-cortex_a15-linux-gnueabihf-linaro_4.9.1-2014.06/bin/arm-eabi-
export ARCH=arm

make tianchi_dual_defconfig
make -j10
rm $TARGET_DIR/zImage $TARGET_DIR/dt.img
cp arch/arm/boot/zImage $TARGET_DIR
cd $TARGET_DIR
./generate_dt.sh
. makeit.sh $KERNEL_NAME
echo PRODUCT :- $(pwd)/$KERNEL_NAME.img
