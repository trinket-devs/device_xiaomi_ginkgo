/*
 * Copyright (C) 2020 ArrowOS
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

package org.lineageos.settings.display;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.MenuItem;

import androidx.preference.Preference;
import androidx.preference.Preference.OnPreferenceChangeListener;
import androidx.preference.PreferenceFragment;
import androidx.preference.PreferenceManager;
import androidx.preference.SeekBarPreference;
import androidx.preference.SwitchPreference;

import org.lineageos.settings.R;
import org.lineageos.settings.utils.FileUtils;
import org.lineageos.settings.display.KcalUtils;

public class KcalSettingsFragment extends PreferenceFragment implements
        OnPreferenceChangeListener {

    private static final String TAG = "KcalSettings";

    private SwitchPreference mKcalSwitchPreference;
    private SeekBarPreference mRedColorSlider;
    private SeekBarPreference mGreenColorSlider;
    private SeekBarPreference mBlueColorSlider;
    private SeekBarPreference mSaturationSlider;
    private SeekBarPreference mContrastSlider;
    private String mInitialStatus;

    @Override
    public void onCreatePreferences(Bundle savedInstanceState, String rootKey) {
        addPreferencesFromResource(R.xml.kcal_settings);
        getActivity().getActionBar().setDisplayHomeAsUpEnabled(true);

        // Check if the node exists and enable / disable the preference depending on the case
        if (FileUtils.fileExists(KcalUtils.KCAL_ENABLE_NODE)) {
            configurePreferences();
        } else {
            mKcalSwitchPreference.setEnabled(false);
        }
    }

    @Override
    public boolean onPreferenceChange(Preference preference, Object newValue) {
        if (preference.getKey().equals("kcal_enable")) {
            KcalUtils.writeConfigToNode(KcalUtils.KCAL_ENABLE_NODE, 0, (Boolean) newValue ? 1 : 0);
        } else if (preference.getKey().equals("red_slider")) {
             KcalUtils.writeConfigToNode(KcalUtils.KCAL_RGB_NODE, 1, (Integer) newValue);
             preference.setSummary(String.valueOf(newValue));
        } else if (preference.getKey().equals("green_slider")) {
            KcalUtils.writeConfigToNode(KcalUtils.KCAL_RGB_NODE, 2, (Integer) newValue);
            mGreenColorSlider.setSummary(String.valueOf(newValue));
        } else if (preference.getKey().equals("blue_slider")) {
            KcalUtils.writeConfigToNode(KcalUtils.KCAL_RGB_NODE, 3, (Integer) newValue);
            mBlueColorSlider.setSummary(String.valueOf(newValue));
        } else if (preference.getKey().equals("saturation_slider")) {
            KcalUtils.writeConfigToNode(KcalUtils.KCAL_SATURATION_NODE, 0, (Integer) newValue);
            mSaturationSlider.setSummary(String.valueOf(newValue));
        } else if (preference.getKey().equals("contrast_slider")) {
            KcalUtils.writeConfigToNode(KcalUtils.KCAL_CONTRAST_NODE, 0, (Integer) newValue);
            mContrastSlider.setSummary(String.valueOf(newValue));
        }
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == android.R.id.home) {
            getActivity().onBackPressed();
            return true;
        }
        return false;
    }

    // Configure the switches, preferences and sliders
    private void configurePreferences() {
        mKcalSwitchPreference = (SwitchPreference) findPreference("kcal_enable");
        mKcalSwitchPreference.setEnabled(true);
        mKcalSwitchPreference.setOnPreferenceChangeListener(this);
        mInitialStatus = FileUtils.readOneLine(KcalUtils.KCAL_ENABLE_NODE);

        if (mInitialStatus.equals("1"))
            mKcalSwitchPreference.setChecked(true);
        else
            mKcalSwitchPreference.setChecked(false);

        // Set the preference so it resets all the other preference's values, and applies the configuration on click
        Preference resetButton = findPreference("reset_default_button");
        resetButton.setOnPreferenceClickListener(new Preference.OnPreferenceClickListener() {
            @Override
            public boolean onPreferenceClick(Preference preference) {
                SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(getContext());
                SharedPreferences.Editor editor = preferences.edit();
                editor.clear();
                editor.commit();
                getPreferenceScreen().removeAll();
                addPreferencesFromResource(R.xml.kcal_settings);
                configurePreferences();
                applyCurrentValues();
                configurePreferences();
                return true;
            }
        });


        mRedColorSlider = (SeekBarPreference) findPreference("red_slider");
        configureSlider(mRedColorSlider, this);

        mGreenColorSlider = (SeekBarPreference) findPreference("green_slider");
        configureSlider(mGreenColorSlider, this);

        mBlueColorSlider = (SeekBarPreference) findPreference("blue_slider");
        configureSlider(mBlueColorSlider, this);

        mSaturationSlider = (SeekBarPreference) findPreference("saturation_slider");
        configureSlider(mSaturationSlider, this);
        mSaturationSlider.setMin(224);

        mContrastSlider = (SeekBarPreference) findPreference("contrast_slider");
        configureSlider(mContrastSlider, this);
        mContrastSlider.setMin(224);
    }


    // Configure the given SeekBarPreference with the given configuration
    private void configureSlider(SeekBarPreference slider, OnPreferenceChangeListener listener) {
        slider.setOnPreferenceChangeListener(listener);
        slider.setSummary(String.valueOf(slider.getValue()));
        slider.setUpdatesContinuously(true);
        slider.setMin(1);
    }

    // Write current sliders values to the nodes
    private void applyCurrentValues() {
        KcalUtils.writeConfigToNode(KcalUtils.KCAL_ENABLE_NODE, 0, mKcalSwitchPreference.isEnabled() ? 1 : 0);
        KcalUtils.writeConfigToNode(KcalUtils.KCAL_RGB_NODE, 1, mRedColorSlider.getValue());
        KcalUtils.writeConfigToNode(KcalUtils.KCAL_RGB_NODE, 2, mGreenColorSlider.getValue());
        KcalUtils.writeConfigToNode(KcalUtils.KCAL_RGB_NODE, 3, mBlueColorSlider.getValue());
        KcalUtils.writeConfigToNode(KcalUtils.KCAL_SATURATION_NODE, 0, mSaturationSlider.getValue());
        KcalUtils.writeConfigToNode(KcalUtils.KCAL_CONTRAST_NODE, 0, mContrastSlider.getValue());
    }
}
