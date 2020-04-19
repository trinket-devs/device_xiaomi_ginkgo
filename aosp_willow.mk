#
# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

# Inherit from custom vendor
$(call inherit-product, vendor/ANXCamera/config.mk)

#GAPPS
TARGET_GAPPS_ARCH := arm64
IS_PHONE := true
TARGET_SUPPORTS_GOOGLE_RECORDER := false

# Inherit from ginkgo device
$(call inherit-product, device/xiaomi/willow/device.mk)

TARGET_BOOT_ANIMATION_RES := 1080
TARGET_INCLUDE_WIFI_EXT := true
TARGET_INCLUDE_STOCK_ARCORE := true
DERP_BUILDTYPE=Official
$(call inherit-product, vendor/aosp/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := aosp_willow
PRODUCT_DEVICE := willow
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Redmi Note 8T
PRODUCT_MANUFACTURER := Xiaomi

CUSTOM_BUILD_TYPE := OFFICIAL
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME="willow" \
    TARGET_DEVICE="willow"

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
