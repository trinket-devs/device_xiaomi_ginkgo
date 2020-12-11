LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SHARED_LIBRARIES := libmedia
LOCAL_SRC_FILES := libmedia_jni.cpp
LOCAL_MODULE := libmedia_jni_shim
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)
