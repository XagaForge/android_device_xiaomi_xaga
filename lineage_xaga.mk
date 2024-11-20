#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from xaga device
$(call inherit-product, device/xiaomi/xaga/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_BRAND := Redmi
PRODUCT_DEVICE := xaga
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_MODEL := 22041216C
PRODUCT_NAME := lineage_xaga

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="xaga-user 14 SP1A.210812.016 V816.0.8.0.ULOCNXM release-keys" \
    BuildFingerprint=Redmi/xaga/xaga:12/SP1A.210812.016/V816.0.8.0.ULOCNXM:user/release-keys
