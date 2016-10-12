#
# Copyright (C) 2016 The Android Open-Source Project
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

LOCAL_PATH := device/google/muskie
QCPATH := vendor/google_devices/muskie/proprietary
SRC_MEDIA_HAL_DIR := hardware/qcom/media/msmcobalt

ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/google/muskie-kernel/Image.gz-dtb
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_CHARACTERISTICS := nosdcard
PRODUCT_SHIPPING_API_LEVEL := 24

DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    $(LOCAL_PATH)/fstab.hardware:root/fstab.$(PRODUCT_HARDWARE) \
    $(LOCAL_PATH)/init.recovery.hardware.rc:root/init.recovery.$(PRODUCT_HARDWARE).rc \
    $(LOCAL_PATH)/init.hardware.rc:root/init.$(PRODUCT_HARDWARE).rc \
    $(LOCAL_PATH)/init.hardware.usb.rc:root/init.$(PRODUCT_HARDWARE).usb.rc \
    $(LOCAL_PATH)/ueventd.hardware.rc:root/ueventd.$(PRODUCT_HARDWARE).rc \

ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
  PRODUCT_COPY_FILES += \
      $(LOCAL_PATH)/init.hardware.diag.rc.userdebug:root/init.$(PRODUCT_HARDWARE).diag.rc
else
  PRODUCT_COPY_FILES += \
      $(LOCAL_PATH)/init.hardware.diag.rc.user:root/init.$(PRODUCT_HARDWARE).diag.rc
endif

BOARD_KERNEL_PAGESIZE := 4096
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4

MSM_VIDC_TARGET_LIST := msmcobalt # Get the color format from kernel headers
MASTER_SIDE_CP_TARGET_LIST := msmcobalt # ION specific settings

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:system/etc/permissions/android.hardware.camera.full.xml\
    frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml\
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:system/etc/permissions/android.hardware.sensor.hifi_sensors.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.power.sh:system/bin/init.power.sh \

PRODUCT_PACKAGES += \
    hwcomposer.msmcobalt \
    gralloc.msmcobalt \
    libbt-vendor \
    lights.$(PRODUCT_HARDWARE)

PRODUCT_PACKAGES += \
    libmm-omxcore \
    libOmxCore

PRODUCT_PACKAGES += \
    camera.msmcobalt \
    libqomx_core \
    libmmjpeg_interface \
    libmmcamera_interface

PRODUCT_PACKAGES += \
    sensors.$(PRODUCT_HARDWARE)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sensors/hals.conf:system/etc/sensors/hals.conf

PRODUCT_PACKAGES += \
    fs_config_dirs \
    fs_config_files

# Vibrator HAL
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sec_config:system/etc/sec_config

PRODUCT_PACKAGES += \
    gps.conf \
    gps.default \
    libgps.utils \
    libloc_eng \
    libloc_api_v02 \
    libloc_ds_api \
    libgnsspps

# setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)
