# Boot animation
TARGET_SCREEN_HEIGHT := 2880
TARGET_SCREEN_WIDTH := 1440

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/google/muskie/aosp_muskie.mk)

include device/google/wahoo/device-lineage.mk

## Device identifier. This must come after all inclusions
PRODUCT_NAME := lineage_muskie
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 2 XL
PRODUCT_RESTRICT_VENDOR_FILES := false

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=muskie \
    PRIVATE_BUILD_DESC="muskie-userdebug O OPD1.170406.005 3893233 dev-keys"

BUILD_FINGERPRINT := google/muskie/muskie:O/OPD1.170406.005/3893233:userdebug/dev-keys

$(call inherit-product-if-exists, vendor/google/muskie/muskie-vendor.mk)