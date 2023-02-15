#!/bin/bash
mkdir ../kernel
# Get Kernel Source
git clone --depth 1 https://github.com/OodavidsinoO/MoneroS-kernel ../kernel
# Copy config
cp ../configs/kernel/backup.config ../kernel/.config
echo "Done getting kernel source and config"
