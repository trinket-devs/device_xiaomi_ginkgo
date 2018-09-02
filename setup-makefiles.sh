#!/bin/bash
#
# Copyright (C) 2018-2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE=ginkgo
VENDOR=xiaomi

INITIAL_COPYRIGHT_YEAR=2019

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

MK_ROOT="${MY_DIR}/../../.."

HELPER="${MK_ROOT}/vendor/aosp/build/tools/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

# Initialize the helper
setup_vendor "${DEVICE}" "${VENDOR}" "${MK_ROOT}"

# Copyright headers and guards
write_headers

write_makefiles "${MY_DIR}/proprietary-files.txt" true

cat << EOF >> "${ANDROIDMK}"

\$(shell mkdir -p \$(TARGET_OUT_VENDOR)/lib/egl && pushd \$(TARGET_OUT_VENDOR)/lib > /dev/null && ln -s egl/libGLESv2_adreno.so libGLESv2_adreno.so && popd > /dev/null)

EOF

# Finish
write_footers
