rm -rf  /workspace/kernelsuredfin/android-kernel/private/msm-google/KernelSU/
cd /workspace/kernelsuredfin/android-kernel/private/msm-google/
git clone https://github.com/tiann/KernelSU
ln -sf "/workspace/kernelsuredfin/android-kernel/private/msm-google/KernelSU/kernel" "/workspace/kernelsuredfin/android-kernel/private/msm-google/drivers/kernelsu"
cp /workspace/kernelsuredfin/kernelsu_redbull/ksu.c /workspace/kernelsuredfin/android-kernel/private/msm-google/KernelSU/kernel/ksu.c
cp /workspace/kernelsuredfin/kernelsu_redbull/open.c /workspace/kernelsuredfin/android-kernel/private/msm-google/fs/open.c
cp /workspace/kernelsuredfin/kernelsu_redbull/exec.c /workspace/kernelsuredfin/android-kernel/private/msm-google/fs/exec.c
cp /workspace/kernelsuredfin/kernelsu_redbull/read_write.c /workspace/kernelsuredfin/android-kernel/private/msm-google/fs/read_write.c
cp /workspace/kernelsuredfin/kernelsu_redbull/stat.c /workspace/kernelsuredfin/android-kernel/private/msm-google/fs/stat.c
cp /workspace/kernelsuredfin/kernelsu_redbull/input.c /workspace/kernelsuredfin/android-kernel/private/msm-google/drivers/input/input.c
cd /workspace/kernelsuredfin/android-kernel
./build_redbull-gki.sh
cd /workspace/kernelsuredfin/
sed -i 's/do.devicecheck=1/do.devicecheck=0/g' AnyKernel3/anykernel.sh
sed -i 's!block=/dev/block/platform/omap/omap_hsmmc.0/by-name/boot;!block=auto;!g' AnyKernel3/anykernel.sh
sed -i 's/is_slot_device=0;/is_slot_device=auto;/g' AnyKernel3/anykernel.sh
cp /workspace/kernelsuredfin/android-kernel/out/android-msm-pixel-4.19/dist/Image.lz4-dtb AnyKernel3/
cd ./AnyKernel3/
zip -r AnyKernel3 . -x ".git*" -x "README.md" -x "*.zip"
