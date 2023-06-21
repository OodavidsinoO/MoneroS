.DEFAULT_GOAL := all

all:
	@echo "Building Moneros Live Linux"
	cd src && sudo ./build_moneros_linux_live.sh

clean:
	@echo "Cleaning Moneros Live Linux"
	cd src && sudo ./00_cleanup.sh

repack:
	@echo "Repacking Moneros Live Linux"
	cd src && sudo ./repackage.sh