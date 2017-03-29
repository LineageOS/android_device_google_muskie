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

$(call inherit-product, device/google/muskie/device-muskie.mk)
$(call inherit-product-if-exists, vendor/google_devices/muskie/device-vendor-muskie.mk)

PRODUCT_PACKAGES += \
    Dialer \
    Launcher3 \
    WallpaperPicker

PRODUCT_MANUFACTURER := Google
PRODUCT_BRAND := Android
PRODUCT_NAME := aosp_muskie
PRODUCT_DEVICE := muskie
PRODUCT_MODEL := AOSP on muskie
