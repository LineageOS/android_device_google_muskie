# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/google/muskie/aosp_walleye.mk)

-include device/google/wahoo/device-lineage.mk

## Device identifier. This must come after all inclusions
PRODUCT_NAME := lineage_walleye
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 2
TARGET_MANUFACTURER := Google

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=walleye \
    PRIVATE_BUILD_DESC="walleye-user 9 PQ1A.190105.004 5148680 release-keys"

BUILD_FINGERPRINT := google/walleye/walleye:9/PQ1A.190105.004/5148680:user/release-keys

PRODUCT_RESTRICT_VENDOR_FILES := false

$(call inherit-product-if-exists, vendor/google/walleye/walleye-vendor.mk)
