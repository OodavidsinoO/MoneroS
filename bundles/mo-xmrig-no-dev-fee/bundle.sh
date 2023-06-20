#!/bin/sh

set -e

./01_get.sh
./02_build.sh
./03_install.sh

cd $SRC_DIR