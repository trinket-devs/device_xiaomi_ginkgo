#!/sbin/sh
# Copy ANXCamera configs to internal storage

rm -rf /sdcard/.ANXCamera/cheatcodes/
mkdir -p /sdcard/.ANXCamera/cheatcodes/
cp -R /system_root/system/etc/ANXCamera/cheatcodes/* /sdcard/.ANXCamera/cheatcodes/

rm -rf /sdcard/.ANXCamera/cheatcodes_reference/
mkdir -p /sdcard/.ANXCamera/cheatcodes_reference/
cp -R /system_root/system/etc/ANXCamera/cheatcodes/* /sdcard/.ANXCamera/cheatcodes_reference/

rm -rf /sdcard/.ANXCamera/features/
mkdir -p /sdcard/.ANXCamera/features/
cp -R /system_root/system/etc/device_features/* /sdcard/.ANXCamera/features/

rm -rf /sdcard/.ANXCamera/features_reference/
mkdir -p /sdcard/.ANXCamera/features_reference/
cp -R /system_root/system/etc/device_features/* /sdcard/.ANXCamera/features_reference/
