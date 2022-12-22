#!/bin/bash
cd ../kernel
# make mrproper
# make tinyconfig

# === Kernel Pre-config ===
# Set hostname
sed -i "s/.*CONFIG_DEFAULT_HOSTNAME.*/CONFIG_DEFAULT_HOSTNAME=\"moneros\"/" .config
# Enable xz
sed -i "s/.*CONFIG_KERNEL_XZ.*/CONFIG_KERNEL_XZ=y/" .config
# No boot logo
sed -i "s/.*CONFIG_LOGO_LINUX_CLUT224.*/\\# CONFIG_LOGO_LINUX_CLUT224 is not set/" .config
# No symbol
sed -i "s/^CONFIG_DEBUG_KERNEL.*/\\# CONFIG_DEBUG_KERNEL is not set/" .config
# Reset ram after reboot
echo "CONFIG_RESET_ATTACK_MITIGATION=y" >> .config
# Fu*k Apple stuffs
echo "CONFIG_APPLE_PROPERTIES=n" >> .config
# Mixed EFI mode
echo "CONFIG_EFI_MIXED=y" >> .config

make menuconfig
time make -j$(nproc)
echo "Installing new kernels"
cp arch/x86/boot/bzImage ../isofs/bzImage
echo "Done"