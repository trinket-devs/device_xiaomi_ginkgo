
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

import org.lineageos.settings.utils.FileUtils;

public final class KcalUtils {

    public static final String KCAL_ENABLE_NODE = "/sys/devices/platform/kcal_ctrl.0/kcal_enable";
    public static final String KCAL_RGB_NODE = "/sys/devices/platform/kcal_ctrl.0/kcal";
    public static final String KCAL_SATURATION_NODE = "/sys/devices/platform/kcal_ctrl.0/kcal_sat";
    public static final String KCAL_CONTRAST_NODE = "/sys/devices/platform/kcal_ctrl.0/kcal_cont";

    // Write the given value to the given position on the KCAL node
    // position 1 is RED
    // position 2 is GREEN
    // position 3 is BLUE
    // RED GREEN BLUE is the format of the data that will be printed to the node

    public static void writeConfigToNode(String node, int position, int value) {
        String mDefaultRgbFormat = "R G B";
        String mNewNodeData = "";

        switch(position) {
            case 0:
                mNewNodeData = String.valueOf(value);
                break;
            case 1:
                mNewNodeData = mDefaultRgbFormat.replace("R", String.valueOf(value));
                break;
            case 2:
                mNewNodeData = mDefaultRgbFormat.replace("G", String.valueOf(value));
                break;
            case 3:
                mNewNodeData = mDefaultRgbFormat.replace("B", String.valueOf(value));
                break;
        }

         mNewNodeData = mNewNodeData
            .replace("R", getNodeData(KCAL_RGB_NODE, 1))
            .replace("G", getNodeData(KCAL_RGB_NODE, 2))
            .replace("B", getNodeData(KCAL_RGB_NODE, 3));

        FileUtils.writeLine(node, mNewNodeData);
    }

    // Get the value of the given position
    // 0 is the full node value
    // 1, 2 and 3 give the first, second and third value respectively
    public static String getNodeData(String node, int position) {
        String mNodeData = FileUtils.readOneLine(node);
        switch(position) {
            case 0:
                return mNodeData;
            case 1:
            case 2:
            case 3:
                return mNodeData.split(" ")[position - 1];
            default:
                return null;
        }
    }
}
