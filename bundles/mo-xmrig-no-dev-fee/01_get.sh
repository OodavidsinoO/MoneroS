#!/bin/sh

set -e

. ../../src/moneros_overlay/common.sh

# Read the common configuration properties.
BASE_URL=`read_property MOXMRIG_URL`
USE_LOCAL_SOURCE=`read_property USE_LOCAL_SOURCE`

# Check $BUNDLE_NAME folder is exists.
if [ "$USE_LOCAL_SOURCE" = "true" -a ! -d "$MAIN_SRC_DIR/source/overlay/$BUNDLE_NAME" ] ; then
  echo "Source bundle $MAIN_SRC_DIR/source/overlay/$ARCHIVE_FILE is missing and will be downloaded."
  USE_LOCAL_SOURCE="false"
fi

cd $MAIN_SRC_DIR/source/overlay

# Delete folder with previously extracted mo-xmrig-no-dev-fee.
echo "Removing $BUNDLE_NAME work area. This may take a while."
rm -rf $WORK_DIR/overlay/$BUNDLE_NAME

git clone $BASE_URL $WORK_DIR/overlay/$BUNDLE_NAME

cd $SRC_DIR
