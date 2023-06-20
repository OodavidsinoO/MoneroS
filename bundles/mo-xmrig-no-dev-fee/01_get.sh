#!/bin/sh

set -e

. ../../common.sh

# Read the common configuration properties.
BASE_URL=`read_property MOXMRIG_URL`
USE_LOCAL_SOURCE=`read_property USE_LOCAL_SOURCE`

TAG=`curl -s $BASE_URL/releases/latest | grep -o '".*"' | sed 's/["v]//g'`

# Grab everything after the last '/' character.
VERSION=${TAG##*/}

ARCHIVE_FILE=v$VERSION.tar.gz
DOWNLOAD_URL=$BASE_URL/archive/v$VERSION.tar.gz

if [ "$USE_LOCAL_SOURCE" = "true" -a ! -f $MAIN_SRC_DIR/source/overlay/$ARCHIVE_FILE ] ; then
  echo "Source bundle $MAIN_SRC_DIR/source/overlay/$ARCHIVE_FILE is missing and will be downloaded."
  USE_LOCAL_SOURCE="false"
fi

cd $MAIN_SRC_DIR/source/overlay

if [ ! "$USE_LOCAL_SOURCE" = "true" ] ; then
  echo "Downloading $BUNDLE_NAME source files from $DOWNLOAD_URL"
  wget $DOWNLOAD_URL
else
  echo "Using local $BUNDLE_NAME source bundle $MAIN_SRC_DIR/source/overlay/$ARCHIVE_FILE"
fi

# Delete folder with previously extracted mo-xmrig-no-dev-fee.
echo "Removing $BUNDLE_NAME work area. This may take a while."
rm -rf $WORK_DIR/overlay/$BUNDLE_NAME
mkdir $WORK_DIR/overlay/$BUNDLE_NAME

# Extract mo-xmrig-no-dev-fee to folder 'work/overlay/mo-xmrig-no-dev-fee'.
# Full path will be something like 'work/overlay/mo-xmrig-no-dev-fee/FIRERSTARTER'.
tar -xvf $ARCHIVE_FILE -C $WORK_DIR/overlay/$BUNDLE_NAME

mv $WORK_DIR/overlay/$BUNDLE_NAME/$BUNDLE_NAME-$VERSION $WORK_DIR/overlay/$BUNDLE_NAME/$BUNDLE_NAME

cd $SRC_DIR
