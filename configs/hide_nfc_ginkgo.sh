#!/sbin/sh
#
# Hide NFC settings in ginkgo

if [ "$(getprop ro.product.name)" == "ginkgo" ]; then
    rm -rf /vendor/etc/permissions/*nfc*
fi
