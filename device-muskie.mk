#
# Copyright 2016 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := 560dpi
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

PRODUCT_HARDWARE := muskie

TARGET_PREBUILT_KERNEL := device/google/muskie-kernel/Image.lz4-dtb

# Kernel modules
PRODUCT_COPY_FILES += \
    device/google/muskie-kernel/synaptics_dsx_core_htc.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/synaptics_dsx_core_htc.ko \
    device/google/muskie-kernel/synaptics_dsx_rmi_dev_htc.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/synaptics_dsx_rmi_dev_htc.ko \
    device/google/muskie-kernel/synaptics_dsx_fw_update_htc.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/synaptics_dsx_fw_update_htc.ko

include device/google/wahoo/device.mk

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=560 \

