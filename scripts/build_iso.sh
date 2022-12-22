#!/bin/bash
cd ../isofs
rm -f ../MoneroS_live.iso
xorriso \
  -as mkisofs \
  -o ../MoneroS_live.iso \
  -b isolinux/isolinux.bin \
  -c isolinux/boot.cat \
  -no-emul-boot \
  -boot-load-size 4 \
  -boot-info-table \
  ./
