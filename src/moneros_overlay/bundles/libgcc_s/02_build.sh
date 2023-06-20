#!/bin/sh

set -e

. ../../common.sh

cd $WORK_DIR/overlay/$BUNDLE_NAME

# Change to the gcc source directory which ls finds, e.g. 'gcc-11.1.0'.
cd $(ls -d gcc-*)

if [ -f Makefile ] ; then
  echo "Preparing '$BUNDLE_NAME' work area. This may take a while."
  make -j $NUM_JOBS clean || true
else
  echo "The clean phase for '$BUNDLE_NAME' has been skipped."
fi

rm -rf $DEST_DIR

echo "Configuring '$BUNDLE_NAME'."
CFLAGS="$CFLAGS" ./configure \
  --prefix=/usr \
  --enable-languages=c \
  --disable-multilib \
  --disable-static \
  --disable-libquadmath \
  --enable-shared

echo "Building '$BUNDLE_NAME'."
make -j $NUM_JOBS all-gcc
make -j $NUM_JOBS all-target-libgcc

echo "Installing '$BUNDLE_NAME'."
make -j $NUM_JOBS install-target-libgcc DESTDIR=$DEST_DIR

mkdir -p $OVERLAY_ROOTFS/lib
# With '--remove-destination' all possibly existing soft links in
# '$OVERLAY_ROOTFS' will be overwritten correctly.
cp -r --remove-destination $DEST_DIR/usr/lib64/libgcc_s.so* \
  $OVERLAY_ROOTFS/lib/

echo "Bundle '$BUNDLE_NAME' has been installed."

cd $SRC_DIR
