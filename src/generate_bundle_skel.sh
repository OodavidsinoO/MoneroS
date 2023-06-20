#!/bin/bash

# Generate basic template for a new overlay package

# Rename the package and package version variables and run this script to
# generate a new overlay template

package=test
ver=2.1

packcaps=${package^^}

echo "Generating new overlay bundle template for '$package'."

cp -r moneros_overlay/bundles/coreutils moneros_overlay/bundles/$package

sed -i "s/.*Full path.*/# Full path will be something like \'work\/overlay\/$package\/$package-$ver\'./" moneros_overlay/bundles/$package/01_get.sh
sed -i "s/.*Extract coreutils.*/# Extract coreutils to folder \'work\/overlay\/$package\'./" moneros_overlay/bundles/$package/01_get.sh
sed -i "s/COREUTILS/$packcaps/g" moneros_overlay/bundles/$package/01_get.sh
sed -i "s/coreutils/$package/g" moneros_overlay/bundles/$package/01_get.sh

sed -i "s/.*source directory which.*/# Change to the coreutils source directory which ls finds, e.g. \'$package-$ver\'./" moneros_overlay/bundles/$package/02_build.sh
sed -i "s/COREUTILS/$packcaps/g" moneros_overlay/bundles/$package/02_build.sh
sed -i "s/coreutils/$package/g" moneros_overlay/bundles/$package/02_build.sh

echo "Created new overlay bundle for $package."
echo "Update .config with source location and a brief description."
echo "Update README with package description and dependencies."
