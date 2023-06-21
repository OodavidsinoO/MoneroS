#!/bin/sh

set -e

. ../../common.sh

echo "Removing old '$BUNDLE_NAME' artifacts. This may take a while."
rm -rf $DEST_DIR
mkdir -p $DEST_DIR/bin/
mkdir -p $DEST_DIR/etc/

echo "cd $DEST_DIR"
cd $DEST_DIR

# Copy xmrig binary and config.json to $DEST_DIR
cp -r $MAIN_SRC_DIR/work/overlay/$BUNDLE_NAME/build/xmrig bin/mo-xmrig
cp -r $MAIN_SRC_DIR/work/overlay/$BUNDLE_NAME/src/config.json etc/mo-xmrig-config.json

chmod +rx bin/mo-xmrig
chmod 777 etc/mo-xmrig-config.json

echo "Bundle 'mo-xmrig-no-dev-fee' has been installed."

cd $SRC_DIR