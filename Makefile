.DEFAULT_GOAL := all

all:
	@echo "Building Moneros Live Linux"
	cd src && sudo ./build_moneros_linux_live.sh
	rm -rf ./distribution/moneros_linux_live.iso
	rm -rf ./distribution/mos_image.tgz
	cp ./src/moneros_linux_live.iso ./distribution/moneros_linux_live.iso
	cp ./src/mos_image.tgz ./distribution/mos_image.tgz
	rm -rf ./src/moneros_linux_live.iso
	rm -rf ./src/mos_image.tgz

clean:
	@echo "Cleaning Moneros Live Linux"
	cd src && sudo ./00_cleanup.sh

repack:
	@echo "Repacking Moneros Live Linux"
	cd src && sudo ./repackage.sh