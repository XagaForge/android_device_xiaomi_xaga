#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/xaga

# Inherit from mt6895-common
include device/xiaomi/mt6895-common/BoardConfigCommon.mk

# Display
TARGET_SCREEN_DENSITY := 440

# HIDL
ODM_MANIFEST_SKUS += \
    xagain \
    xagainpro

ODM_MANIFEST_XAGAIN_FILES := $(DEVICE_PATH)/manifest_xagain.xml
ODM_MANIFEST_XAGAINPRO_FILES := $(DEVICE_PATH)/manifest_xagain.xml

# Kernel
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules/modules.load))
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules/modules.load.recovery))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules/modules.load.vendor_boot))
BOOT_KERNEL_MODULES := $(BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD) $(BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD)

# Platform
BOARD_HAVE_MTK_FM := true

# Properties
TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Security Patch Level
VENDOR_SECURITY_PATCH := 2024-09-01

# Inherit the proprietary files
include vendor/xiaomi/xaga/BoardConfigVendor.mk
