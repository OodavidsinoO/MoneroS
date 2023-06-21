#!/bin/sh

set -e

# Load common properties and functions in the current script.
. ./common.sh

echo "*** GENERATE IMAGE BEGIN ***"

# Prepare the work area.
rm -f $SRC_DIR/mos_image.tgz
rm -rf $WORK_DIR/mos_image
mkdir -p $WORK_DIR/mos_image

if [ -d $ROOTFS ] ; then
  # Copy the rootfs.
  cp -r $ROOTFS/* \
    $WORK_DIR/mos_image
else
  echo "Cannot continue - rootfs is missing."
  exit 1
fi

if [ -d $OVERLAY_ROOTFS ] && \
   [ ! "`ls -A $OVERLAY_ROOTFS`" = "" ] ; then

  echo "Merging overlay software in image."

  # Copy the overlay content.
  # With '--remove-destination' all possibly existing soft links in
  # $WORK_DIR/mos_image will be overwritten correctly.
  cp -r --remove-destination $OVERLAY_ROOTFS/* \
    $WORK_DIR/mos_image
  cp -r --remove-destination $SRC_DIR/moneros_overlay/rootfs/* \
    $WORK_DIR/mos_image
else
  echo "MLL image will have no overlay software."
fi

cd $WORK_DIR/mos_image

# Generate the image file (ordinary 'tgz').
tar -zcf $SRC_DIR/mos_image.tgz *

cat << CEOF

  ##################################################################
  #                                                                #
  #  MoneroS Linux Live image 'mos_image.tgz' has been generated.  #
  #                                                                #
  #  You can import the MOS image in Docker like this:             #
  #                                                                #
  #    docker import mos_image.tgz moneros-linux-live:latest       #
  #                                                                #
  #  Then you can run MOS shell in Docker container like this:     #
  #                                                                #
  #    docker run -it moneros-linux-live /bin/sh                   #
  #                                                                #
  ##################################################################

CEOF

echo "*** GENERATE IMAGE END ***"
