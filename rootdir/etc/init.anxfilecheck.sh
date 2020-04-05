#!/vendor/bin/sh
#
# A simple script that checks if the anx directories are present

ANX_DIR="/sdcard/.ANXCamera/"

if [ -d $ANX_DIR ]; then
	exit 0
else
	mkdir -p /sdcard/.ANXCamera/cheatcodes/
	cp -R /system/etc/ANXCamera/cheatcodes/* /sdcard/.ANXCamera/cheatcodes/
	mkdir -p /sdcard/.ANXCamera/cheatcodes_reference/
	cp -R /system/etc/ANXCamera/cheatcodes/* /sdcard/.ANXCamera/cheatcodes_reference/
	mkdir -p /sdcard/.ANXCamera/features/
	cp -R /system/etc/device_features/* /sdcard/.ANXCamera/features/
	mkdir -p /sdcard/.ANXCamera/features_reference/
	cp -R /system/etc/device_features/* /sdcard/.ANXCamera/features_reference/
fi
