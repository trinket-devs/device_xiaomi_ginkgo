#!/sbin/sh
#
# Hide NFC settings in ginkgo

if [ "$(getprop ro.boot.hwversion)" != "18.39.0" ] || [ "$(getprop ro.boot.hwc)" != "Global_B" ] ; then
    rm -rf /vendor/etc/permissions/*nfc*
else
    exit 0
fi
