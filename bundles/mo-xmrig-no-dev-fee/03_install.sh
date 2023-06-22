#!/bin/sh

set -e

. ../../src/moneros_overlay/common.sh

echo "Removing old '$BUNDLE_NAME' artifacts. This may take a while."
rm -rf $DEST_DIR
mkdir -p $DEST_DIR/bin/
mkdir -p $DEST_DIR/etc/
mkdir -p $DEST_DIR/etc/autorun/

# Copy 99_mo-xmrig.sh to $DEST_DIR/etc/autorun/
cp -r 99_mo-xmrig.sh $DEST_DIR/etc/autorun/

echo "cd $DEST_DIR"
cd $DEST_DIR

# Copy xmrig binary and config.json to $DEST_DIR
cp -r $MAIN_SRC_DIR/work/overlay/$BUNDLE_NAME/build/xmrig bin/mo-xmrig
cp -r $MAIN_SRC_DIR/work/overlay/$BUNDLE_NAME/src/config.json etc/mo-xmrig-config.json

chmod +rx bin/mo-xmrig
chmod 777 etc/mo-xmrig-config.json
chmod +rx etc/autorun/99_mo-xmrig.sh

# Reduce size of binaries.
echo "Reducing size of binaries. This may take a while."
reduce_size bin/mo-xmrig

# With '--remove-destination' all possibly existing soft links in
# '$OVERLAY_ROOTFS' will be overwritten correctly.
cp -r --remove-destination $DEST_DIR/* \
  $OVERLAY_ROOTFS

echo "Bundle 'mo-xmrig-no-dev-fee' has been installed."

cd $SRC_DIR