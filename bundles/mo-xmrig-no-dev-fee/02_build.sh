#!/bin/sh

set -e

. ../../common.sh

cd $WORK_DIR/overlay/$BUNDLE_NAME/$BUNDLE_NAME

echo "Generating source files."
./code-generator.py

echo "Building $BUNDLE_NAME."
make

cd $SRC_DIR
