#
# Copyright (C) 2014 The CyanogenMod Project
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

$(call inherit-product-if-exists, vendor/samsung/apexqtmo/apexqtmo-vendor.mk)

## overlays
DEVICE_PACKAGE_OVERLAYS += device/samsung/apexqtmo/overlay

# Boot animation and screen size
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480
PRODUCT_PROPERTY_OVERRIDES += ro.sf.lcd_density=240

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

# Audio configuration
PRODUCT_COPY_FILES += \
    device/samsung/apexqtmo/audio/snd_soc_msm_2x:system/etc/snd_soc_msm/snd_soc_msm_2x \
    device/samsung/apexqtmo/audio/audio_policy.conf:system/etc/audio_policy.conf

# Doze
PRODUCT_PACKAGES += \
    SamsungDoze

# GPS
PRODUCT_PACKAGES += \
    gps.msm8960 \
    libgps.utils \
    libloc_core \
    libloc_eng

PRODUCT_COPY_FILES += \
    device/samsung/apexqtmo/gps/etc/gps.conf:system/etc/gps.conf \
    device/samsung/apexqtmo/gps/etc/sap.conf:system/etc/sap.conf

# Keylayout
PRODUCT_COPY_FILES += \
    device/samsung/apexqtmo/keyboard/fsa9485.kl:system/usr/keylayout/fsa9485.kl \
    device/samsung/apexqtmo/keyboard/sec_keypad.kl:system/usr/keylayout/sec_keypad.kl \
    device/samsung/apexqtmo/keyboard/sec_keypad.kcm:system/usr/keychars/sec_keypad.kcm \
    device/samsung/apexqtmo/keyboard/sec_keypad.idc:system/usr/idc/sec_keypad.idc \
    device/samsung/apexqtmo/keyboard/sec_keys.kl:system/usr/keylayout/sec_keys.kl \
    device/samsung/apexqtmo/keyboard/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl \
    device/samsung/apexqtmo/keyboard/sii9234_rcp.kl:system/usr/keylayout/sii9234_rcp.kl

PRODUCT_PACKAGES += \
    ApexQKeypad

# Logo
PRODUCT_COPY_FILES += \
    device/samsung/apexqtmo/initlogo.rle:root/initlogo.rle

# Media configuration
PRODUCT_COPY_FILES += \
    device/samsung/apexqtmo/media/media_profiles.xml:system/etc/media_profiles.xml

# NFC
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag \
    com.android.nfc_extras

ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := $(LOCAL_PATH)/configs/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := $(LOCAL_PATH)/configs/nfcee_access_debug.xml
endif
PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml

# Wifi
# Wifi
PRODUCT_COPY_FILES += \
    device/samsung/apexqtmo/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    device/samsung/apexqtmo/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    device/samsung/apexqtmo/wifi/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini

PRODUCT_PACKAGES += \
    libwcnss_qmi \
    wcnss_service
    WCNSS_cfg.dat \
    WCNSS_qcom_wlan_nv.bin

PRODUCT_PACKAGES += \
    libnetcmdiface

# common msm8960
$(call inherit-product, device/samsung/msm8960-common/msm8960.mk)
