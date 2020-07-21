LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_C_INCLUDES := vendor/qcom/opensource/power
LOCAL_SHARED_LIBRARIES := liblog libutils
LOCAL_HEADER_LIBRARIES += libhardware_headers
LOCAL_SRC_FILES := power-ginkgo.c
LOCAL_MODULE := libpower_ginkgo
LOCAL_VENDOR_MODULE := true
include $(BUILD_STATIC_LIBRARY)
