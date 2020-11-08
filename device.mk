LOCAL_PATH := device/asus/I001D

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/embedded.mk)

# define hardware platform
PRODUCT_PLATFORM := msmnile
TARGET_USES_HARDWARE_QCOM_BOOTCTRL := true

# A/B support
PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier

PRODUCT_PACKAGES += \
    bootctrl.$(PRODUCT_PLATFORM) \
    update_engine_sideload

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Enable update engine sideloading by including the static version of the
# boot_control HAL and its dependencies.
PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.$(PRODUCT_PLATFORM) \
    libgptutils \
    libz \
    libcutils

# qcom standard decryption
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe \

# tzdata
PRODUCT_PACKAGES += \
    tzdata_twrp \

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service \

# Blacklist
PRODUCT_SYSTEM_PROPERTY_BLACKLIST += \
    ro.bootimage.build.date.utc \
    ro.build.date.utc

# Overrides
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=WW_I001D \
    BUILD_PRODUCT=ZS660KL \
    TARGET_DEVICE=ASUS_I001_1

PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.build.security_patch=2099-12-31

# Include ASUS keys for zip signature verification
PRODUCT_EXTRA_RECOVERY_KEYS += $(LOCAL_PATH)/security/asus
