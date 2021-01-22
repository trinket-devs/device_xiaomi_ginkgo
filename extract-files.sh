#!/bin/bash
#
# Copyright (C) 2018-2019 The LineageOS Project
# Copyright (C) 2020 Paranoid Android
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

ARROW_ROOT="${MY_DIR}"/../../..

HELPER="${ARROW_ROOT}/vendor/arrow/build/tools/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

# Default to sanitizing the vendor folder before extraction
CLEAN_VENDOR=true

ONLY_COMMON=false
ONLY_DEVICE=false

while [ "${#}" -gt 0 ]; do
    case "${1}" in
        -o | --only-common )
                ONLY_COMMON=true
                ;;
        -d | --only-device )
                ONLY_DEVICE=true
                ;;
        -n | --no-cleanup )
                CLEAN_VENDOR=false
                ;;
        -k | --kang )
                KANG="--kang"
                ;;
        -s | --section )
                SECTION="${2}"; shift
                CLEAN_VENDOR=false
                ;;
        * )
                SRC="${1}"
                ;;
    esac
    shift
done

if [ -z "${SRC}" ]; then
    SRC="adb"
fi

function blob_fixup() {
    case "${1}" in
    vendor/etc/camera/camera_config.xml)
        # Remove vtcamera for ginkgo
        gawk -i inplace '{ p = 1 } /<CameraModuleConfig>/{ t = $0; while (getline > 0) { t = t ORS $0; if (/ginkgo_vtcamera/) p = 0; if (/<\/CameraModuleConfig>/) break } $0 = t } p' "${2}"
        ;;
    esac
}

if [ "$ONLY_DEVICE" == "false" ] && [ -s "${MY_DIR}/proprietary-files.txt" ]; then
    # Initialize the helper for common
    setup_vendor "$DEVICE_COMMON" "$VENDOR" "$ARROW_ROOT" true "$CLEAN_VENDOR"
    extract "${MY_DIR}/proprietary-files.txt" "$SRC" "$KANG" --section "$SECTION"
fi

if [ "$ONLY_COMMON" == "false" ] && [ -s "${MY_DIR}/../${DEVICE}/proprietary-files.txt" ]; then
    # Reinitialize the helper for device
    setup_vendor "$DEVICE" "$VENDOR" "$ARROW_ROOT" false "$CLEAN_VENDOR"
    extract "${MY_DIR}/../${DEVICE}/proprietary-files.txt" "$SRC" "$KANG" --section "$SECTION"
fi

ONLY_DEVICE=$ONLY_DEVICE ONLY_COMMON=$ONLY_COMMON "${MY_DIR}/setup-makefiles.sh"
