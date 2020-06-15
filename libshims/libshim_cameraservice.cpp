#include <common/CameraProviderManager.h>
#include <android/hardware/camera/device/3.5/ICameraDevice.h>

namespace android {

void CameraProviderManager::ProviderInfo::DeviceInfo3::queryPhysicalCameraHax() {
    camera_metadata_entry_t entryCap;

    entryCap = mCameraCharacteristics.find(ANDROID_REQUEST_AVAILABLE_CAPABILITIES);
    for (size_t i = 0; i < entryCap.count; ++i) {
        uint8_t capability = entryCap.data.u8[i];
        if (capability == ANDROID_REQUEST_AVAILABLE_CAPABILITIES_LOGICAL_MULTI_CAMERA) {
                mIsLogicalCamera = true;
                break;
        }
    }

    if (!mIsLogicalCamera) return;

    // skipping id = 61 check here because we have only 1 logical camera
    mPhysicalIds.push_back("20");
}

} // namespace android
