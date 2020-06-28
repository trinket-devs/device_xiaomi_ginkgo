LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := platform
LOCAL_PACKAGE_NAME := NoCutoutOverlay
LOCAL_SDK_VERSION := current
LOCAL_PRIVILEGED_MODULE := false

include $(BUILD_PACKAGE)
