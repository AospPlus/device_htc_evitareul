# Copyright (C) 2009 The Android Open Source Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# Skip droiddoc build to save build time
BOARD_SKIP_ANDROID_DOC_BUILD := true

# Audio
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := false

#Camera
USE_CAMERA_STUB := false
CAMERA_USES_SURFACEFLINGER_CLIENT_STUB := true
BOARD_HAVE_HTC_FFC := true
BOARD_CAMERA_HAVE_ISO := true
COMMON_GLOBAL_CFLAGS += -DICS_CAMERA_BLOB 
COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK

# Board 
TARGET_BOARD_PLATFORM := tegra
TARGET_NO_BOOTLOADER := true
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_32_BYTE_CACHE_LINES := true
ARCH_ARM_USE_NON_NEON_MEMCPY := true

# Optimization build flags
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp

# Board nameing
TARGET_NO_RADIOIMAGE := true
TARGET_BOOTLOADER_BOARD_NAME := 
TARGET_BOARD_PLATFORM := tegra

# Enable WEBGL in WebKit
ENABLE_WEBGL := true

# EGL settings
USE_OPENGL_RENDERER := true
BOARD_EGL_NEEDS_LEGACY_FB := true
BOARD_EGL_CFG := device/htc/evitareul/configs/egl.cfg

# Graphics - Skia
BOARD_USE_SKIA_LCDTEXT := true

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
#WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/system/etc/firmware/fw_bcm4334.bin"
WIFI_DRIVER_FW_PATH_AP      := "/system/etc/firmware/fw_bcm4334_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P     := "/system/etc/firmware/fw_bcm4334_p2p.bin"


# BT
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/htc/evitareul/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/htc/evitareul/bluetooth/vnd_evitareul.txt

# USB
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/f_mass_storage/lun0/file"
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 22
BOARD_HAS_SDCARD_INTERNAL := true

# HTCLOG
COMMON_GLOBAL_CFLAGS += -DHTCLOG

# Kernel
TARGET_PROVIDES_INIT_TARGET_RC := true
TARGET_KERNEL_SOURCE := kernel/htc/evitareul
TARGET_KERNEL_CONFIG := lenrek_defconfig

# NFC
BOARD_HAVE_NFC := true

# HTC ril compatability
BOARD_USE_NEW_LIBRIL_HTC := true
TARGET_PROVIDES_LIBRIL := vendor/htc/evitareul/proprietary/lib/libril.so

# Enable WEBGL in WebKit
ENABLE_WEBGL := true

# Partition Info
#dev:        size     erasesize name
#mmcblk0p5: 00800000 00001000 "recovery"
#mmcblk0p4: 00800000 00001000 "boot"
#mmcblk0p16: 60000000 00001000 "system"
#mmcblk0p17: 10000000 00001000 "cache"
#mmcblk0p20: 00200000 00001000 "misc"
#mmcblk0p1: 00600000 00001000 "wlan"
#mmcblk0p2: 00200000 00001000 "WDM"
#mmcblk0p25: 00200000 00001000 "pdata"
#mmcblk0p3: 00600000 00001000 "radiocab"
#mmcblk0p18: e00000000 00001000 "userdata"
#mmcblk0p24: 01a00000 00001000 "devlog"
#mmcblk0p19: 00200000 00001000 "extra"
#mmcblk0p14: 03400000 00001000 "mdm9k"
#mmcblk0p15: 00800000 00001000 "mdm9k_config"
#mmcblk0p21: 00800000 00001000 "modem_st1"
#mmcblk0p22: 00800000 00001000 "modem_st2"

# Boot/Recovery image settings
BOARD_KERNEL_CMDLINE :=
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048

# Memory
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1342177280
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2302672896
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 22
BOARD_HAS_SDCARD_INTERNAL := true

#Recovery

# CWM Configurations UNCOMMENT TO USE CWM
TARGET_RECOVERY_INITRC := device/htc/evitareul/recovery/init.rc
BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_MISC_PARTITION := false
BOARD_UMS_LUNFILE := "/sys/devices/platform/fsl-tegra-udc/gadget/lun0/file"
TARGET_PREBUILT_RECOVERY_KERNEL := device/htc/evitareul/prebuilt/kernel
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := false
