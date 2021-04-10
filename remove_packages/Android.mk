LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := RemovePackages
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_OVERRIDES_PACKAGES := AmbientSensePrebuilt AndroidAutoStubPrebuilt AppDirectedSMSService Camera2 ConnMO DCMO FilesPrebuilt MaestroPrebuilt MyVerizonServices OBDM_Permissions OemDmTrigger obdm_stub SafetyHubPrebuilt Snap SoundAmplifierPrebuilt SprintDM SprintHM Tycho USCCDM VZWAPNLib VzwOmaTrigger WallpapersBReel2020
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_SRC_FILES := /dev/null
include $(BUILD_PREBUILT)
