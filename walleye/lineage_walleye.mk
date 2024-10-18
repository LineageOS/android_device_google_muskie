# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/google/muskie/aosp_walleye.mk)

include device/google/wahoo/device-lineage.mk

## Device identifier. This must come after all inclusions
PRODUCT_NAME := lineage_walleye
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 2
PRODUCT_RESTRICT_VENDOR_FILES := false

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="walleye-user 11 RP1A.201005.004.A1 6934943 release-keys" \
    BuildFingerprint=google/walleye/walleye:11/RP1A.201005.004.A1/6934943:user/release-keys \
    DeviceName=walleye

$(call inherit-product, vendor/google/walleye/walleye-vendor.mk)
