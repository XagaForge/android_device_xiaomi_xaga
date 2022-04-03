#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from mt6895-common
$(call inherit-product, device/xiaomi/mt6895-common/mt6895.mk)

# Call the MiuiCamera setup
$(call inherit-product-if-exists, vendor/xiaomi/miuicamera-xaga/device.mk)

# Fastboot package
PRODUCT_BUILD_SUPER_PARTITION := true
PRODUCT_FASTBOOT_TEMPLATE_ZIP := $(LOCAL_PATH)/prebuilts/fastboot.zip
PRODUCT_FASTBOOT_IMAGES_PATH := images

# FM Radio
PRODUCT_PACKAGES += \
    FMRadio

# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    Tag

PRODUCT_PACKAGES += \
    android.hardware.nfc-service.nxp

$(foreach sku, xaga xagapro, \
    $(eval PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_$(sku)/android.hardware.nfc.ese.xml \
        frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_$(sku)/android.hardware.nfc.hce.xml \
        frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_$(sku)/android.hardware.nfc.hcef.xml \
        frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_$(sku)/android.hardware.nfc.uicc.xml \
        frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_$(sku)/android.hardware.nfc.xml \
        frameworks/native/data/etc/android.hardware.se.omapi.ese.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_$(sku)/android.hardware.se.omapi.ese.xml \
        frameworks/native/data/etc/android.hardware.se.omapi.uicc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_$(sku)/android.hardware.se.omapi.uicc.xml \
        frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_$(sku)/com.android.nfc_extras.xml \
        frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_$(sku)/com.nxp.mifare.xml))

# Overlay
PRODUCT_PACKAGES += \
    FrameworksResXaga \
    FrameworksResXagaPro \
    FrameworksResXagaProIn \
    NfcOverlayXaga \
    NfcOverlayXagaPro \
    SettingsProviderOverlayXagaCn \
    SettingsProviderOverlayXaga \
    SettingsProviderOverlayXagaIn \
    SettingsProviderOverlayXagaProCn \
    SettingsProviderOverlayXagaPro \
    SettingsProviderOverlayXagaProIn \
    SystemUIResXaga \
    WifiOverlayXaga \
    WifiOverlayXagaCn \
    WifiOverlayXagaIn \
    WifiOverlayXagaPro \
    WifiOverlayXagaProCn \
    WifiOverlayXagaProIn

# Rootdir
PRODUCT_PACKAGES += \
    init.xaga.rc

# Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Shipping API Level
PRODUCT_SHIPPING_API_LEVEL := 31

# Sku properties
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/sku/,$(TARGET_COPY_OUT_ODM)/etc)

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/mediatek/libfmjni

# Inherit the proprietary files
$(call inherit-product, vendor/xiaomi/xaga/xaga-vendor.mk)
