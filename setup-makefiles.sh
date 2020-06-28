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

AOSPA_ROOT="${MY_DIR}/../../.."

HELPER="${AOSPA_ROOT}/vendor/pa/build/tools/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

if [ -z $ONLY_DEVICE ]; then
    ONLY_DEVICE=false
fi

if [ -z $ONLY_COMMON ]; then
    ONLY_COMMON=false
fi

while [ "${#}" -gt 0 ]; do
    case "${1}" in
        -o | --only-common )
                ONLY_COMMON=true
                ;;
        -d | --only-device )
                ONLY_DEVICE=true
                ;;
    esac
    shift
done

if [ "$ONLY_DEVICE" == "false" ] && [ -s "${MY_DIR}/proprietary-files.txt" ]; then
    # Initialize the helper for common
    setup_vendor "${DEVICE_COMMON}" "${VENDOR}" "${AOSPA_ROOT}" true

    # Copyright headers and guards
    write_headers "ginkgo laurel_sprout"

    # The standard common blobs
    write_makefiles "${MY_DIR}/proprietary-files.txt" true

    # Finish
    write_footers
fi

if [ "$ONLY_COMMON" == "false" ] && [ -s "${MY_DIR}/../${DEVICE}/proprietary-files.txt" ]; then
    # Reinitialize the helper for device
    setup_vendor "${DEVICE}" "${VENDOR}" "${AOSPA_ROOT}" false

    # Copyright headers and guards
    write_headers

    # The standard device blobs
    write_makefiles "${MY_DIR}/../${DEVICE}/proprietary-files.txt" true

    # Finish
    write_footers
fi
