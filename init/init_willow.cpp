/*
   Copyright (c) 2014, The Linux Foundation. All rights reserved.

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

#include <stdlib.h>
#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>

#include <android-base/properties.h>
#include "property_service.h"
#include "vendor_init.h"

using android::base::GetProperty;
using android::init::property_set;
using std::string;

void property_override(string prop, string value)
{
    auto pi = (prop_info*) __system_property_find(prop.c_str());

    if (pi != nullptr)
        __system_property_update(pi, value.c_str(), value.size());
    else
        __system_property_add(prop.c_str(), prop.size(), value.c_str(), value.size());
}

void vendor_load_properties()
{
    property_override(string("ro.opa.eligible_device"), string("true"));
    property_override(string("ro.com.google.ime.theme_idi"), string("5"));
    property_override(string("ro.com.google.ime.height_ratio"), string("1.0"));
    property_override(string("ro.com.google.ime.bs_theme"), string("true"));
    property_override(string("ro.com.google.ime.system_lm_dir"), string("/product/usr/share/ime/google/d3_lms"));
    property_override(string("persist.rcs.supported"), string("1"));
    property_override(string("ro.product.model"), string("Pixel 4 XL"));
    property_override(string("ro.product.brand"), string("google"));
    property_override(string("ro.product.name"), string("coral"));
    property_override(string("ro.product.device"), string("coral"));
    property_override(string("ro.product.manufacturer"), string("Google"));
    property_override(string("ro.build.fingerprint"), string("google/coral/coral:10/QQ2A.200501.001.A3/6353761:user/release-keys"));
    property_override(string("ro.system.build.date"), string("Wed Apr  1 05:17:57 UTC 2020"));
    property_override(string("ro.system.build.date.utc"), string("1585718277"));
    property_override(string("ro.system.build.fingerprint"), string("google/coral/coral:10/QQ2A.200501.001.A3/6353761:user/release-keys"));
    property_override(string("ro.system.build.id"), string("QQ2A.200501.001.A3"));
    property_override(string("ro.system.build.tags"), string("release-keys"));
    property_override(string("ro.system.build.version.incremental"), string("6353761"));
    property_override(string("ro.product.system.brand"), string("google"));
    property_override(string("ro.product.system.device"), string("generic"));
    property_override(string("ro.product.system.manufacturer"), string("Google"));
    property_override(string("ro.product.system.model"), string("mainline"));
    property_override(string("ro.product.system.name"), string("mainline"));
    property_override(string("ro.build.id"), string("QQ2A.200501.001.A3"));
    property_override(string("ro.build.display.id"), string("QQ2A.200501.001.A3"));
    property_override(string("ro.build.version.incremental"), string("6353761"));
    property_override(string("ro.build.date"), string("Wed Apr  1 05:17:57 UTC 2020"));
    property_override(string("ro.build.date.utc"), string("1585718277"));
    property_override(string("ro.build.type"), string("user"));
    property_override(string("ro.build.user"), string("android-build"));
    property_override(string("ro.build.host"), string("abfarm-01331"));
    property_override(string("ro.build.tags"), string("release-keys"));
    property_override(string("ro.build.flavor"), string("coral-user"));
    property_override(string("ro.build.product"), string("coral"));
    property_override(string("ro.build.description"), string("coral-user 10 QQ2A.200501.001.A3 6353761 release-keys"));
    property_override(string("ro.product.build.date"), string("Wed Apr  1 05:17:57 UTC 2020"));
    property_override(string("ro.product.build.date.utc"), string("1585718277"));
    property_override(string("ro.product.build.fingerprint"), string("google/coral/coral:10/QQ2A.200501.001.A3/6353761:user/release-keys"));
    property_override(string("ro.product.build.id"), string("QQ2A.200501.001.A3"));
    property_override(string("ro.product.build.tags"), string("release-keys"));
    property_override(string("ro.product.build.type"), string("user"));
    property_override(string("ro.product.build.version.incremental"), string("6353761"));
    property_override(string("ro.product.build.version.release"), string("10"));
    property_override(string("ro.product.build.version.sdk"), string("29"));
    property_override(string("ro.product.product.brand"), string("google"));
    property_override(string("ro.product.product.device"), string("coral"));
    property_override(string("ro.product.product.manufacturer"), string("Google"));
    property_override(string("ro.product.product.model"), string("Pixel 4 XL"));
    property_override(string("ro.product.product.name"), string("coral"));
    property_override(string("ro.product.first_api_level"), string("29"));
    property_override(string("ro.vendor.build.security_patch"), string("2020-04-05"));
    property_override(string("ro.vendor.build.date"), string("Wed Apr  1 05:17:57 UTC 2020"));
    property_override(string("ro.vendor.build.date.utc"), string("1585718277"));
    property_override(string("ro.vendor.build.fingerprint"), string("google/coral/coral:10/QQ2A.200501.001.A3/6353761:user/release-keys"));
    property_override(string("ro.vendor.build.id"), string("QQ2A.200501.001.A3"));
    property_override(string("ro.vendor.build.tags"), string("release-keys"));
    property_override(string("ro.vendor.build.version.incremental"), string("6353761"));
    property_override(string("ro.product.vendor.brand"), string("google"));
    property_override(string("ro.product.vendor.device"), string("coral"));
    property_override(string("ro.product.vendor.manufacturer"), string("Google"));
    property_override(string("ro.product.vendor.model"), string("Pixel 4 XL"));
    property_override(string("ro.product.vendor.name"), string("coral"));
    property_override(string("ro.bootimage.build.date"), string("Tue Mar 3 00:22:58 UTC 2020"));
    property_override(string("ro.bootimage.build.date.utc"), string("1585718277"));
    property_override(string("ro.bootimage.build.fingerprint"), string("google/coral/coral:10/QQ2A.200501.001.A3/6353761:user/release-keys"));
    property_override(string("ro.odm.build.date"), string("Wed Apr  1 05:17:57 UTC 2020"));
    property_override(string("ro.odm.build.date.utc"), string("1585718277"));
    property_override(string("ro.odm.build.fingerprint"), string("google/coral/coral:10/QQ2A.200501.001.A3/6353761:user/release-keys"));
    property_override(string("ro.odm.build.id"), string("QQ2A.200501.001.A3"));
    property_override(string("ro.odm.build.tags"), string("release-keys"));
    property_override(string("ro.odm.build.version.incremental"), string("6353761"));
    property_override(string("ro.product.odm.brand"), string("google"));
    property_override(string("ro.product.odm.device"), string("coral"));
    property_override(string("ro.product.odm.manufacturer"), string("Google"));
    property_override(string("ro.product.odm.model"), string("Pixel 4 XL"));
    property_override(string("ro.product.odm.name"), string("coral"));
    }
