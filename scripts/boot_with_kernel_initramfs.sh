#!/bin/bash
qemu-system-x86_64 -kernel ../kernel/arch/x86/boot/bzImage -initrd ../initramfs/initramfs.cpio.xz -append "init=/bin/sh"
