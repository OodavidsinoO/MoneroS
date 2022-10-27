#!/bin/bash
cd ../kernel
make mrproper
make tinyconfig
make menuconfig
time make -j$(nproc)
