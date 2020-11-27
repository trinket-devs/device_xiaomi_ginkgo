/*
 * Copyright (C) 2015 The CyanogenMod Project
 *               2017-2018 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.lineageos.settings;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.util.Log;

import androidx.preference.PreferenceManager;

import org.lineageos.settings.dirac.DiracUtils;
import org.lineageos.settings.display.KcalUtils;

public class BootCompletedReceiver extends BroadcastReceiver {
    private static final boolean DEBUG = false;
    private static final String TAG = "XiaomiParts";

    @Override
    public void onReceive(final Context context, Intent intent) {
        SharedPreferences sharedPrefs = PreferenceManager.getDefaultSharedPreferences(context);

        if (DEBUG)
            Log.d(TAG, "Received boot completed intent");

        new DiracUtils(context).onBootCompleted();

        FileUtils.writeLine(KcalUtils.KCAL_ENABLE_NODE,
            sharedPrefs.getBoolean("kcal_enable", false) ? "1" : "0");

        KcalUtils.writeConfigToNode(KcalUtils.KCAL_RGB_NODE, 1, sharedPrefs.getInt("red_slider", 256));
        KcalUtils.writeConfigToNode(KcalUtils.KCAL_RGB_NODE, 2, sharedPrefs.getInt("green_slider", 256));
        KcalUtils.writeConfigToNode(KcalUtils.KCAL_RGB_NODE, 3, sharedPrefs.getInt("blue_slider", 256));
        KcalUtils.writeConfigToNode(KcalUtils.KCAL_SATURATION_NODE, 0, sharedPrefs.getInt("saturation_slider", 255));
        KcalUtils.writeConfigToNode(KcalUtils.KCAL_CONTRAST_NODE, 0, sharedPrefs.getInt("contrast_slider", 255));
    }
}
