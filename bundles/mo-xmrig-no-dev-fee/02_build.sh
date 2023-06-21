#!/bin/sh

set -e

. ../../src/moneros_overlay/common.sh

cd $WORK_DIR/overlay/$BUNDLE_NAME

mkdir build && cd scripts
./build_deps.sh && cd ../build

cmake .. -DXMRIG_DEPS=scripts/deps -DBUILD_STATIC=ON
echo "Building $BUNDLE_NAME."
make -j$(nproc)

cd $SRC_DIR
