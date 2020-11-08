# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/embedded.mk)

# Default device path for common folder
DEVICE_PATH := device/$(BOARD_VENDOR)/$(PRODUCT_RELEASE_NAME)

# A/B support
AB_OTA_UPDATER := true

# A/B updater updatable partitions list. Keep in sync with the partition list
# with "_a" and "_b" variants in the device. Note that the vendor can add more
# more partitions to this list for the bootloader and radio.
AB_OTA_PARTITIONS += \
    boot \
    system \
    vendor \
    vbmeta \
    dtbo

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

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service \

# Overrides
PLATFORM_VERSION := 20.1.0
PLATFORM_SECURITY_PATCH := 2099-12-31
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=WW_$(PRODUCT_RELEASE_NAME) \
    TARGET_DEVICE=$(shell echo $(BOARD_VENDOR) | tr  '[:lower:]' '[:upper:]')_I001_1
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.product=ZS660KL \
    ro.vendor.build.security_patch=$(PLATFORM_SECURITY_PATCH)

# Include OEM keys for zip signature verification
PRODUCT_EXTRA_RECOVERY_KEYS += $(DEVICE_PATH)/security/$(BOARD_VENDOR)
