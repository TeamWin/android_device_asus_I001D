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
    update_engine_sideload \
    update_verifier

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Api
PRODUCT_SHIPPING_API_LEVEL := 28

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl.recovery \
    android.hardware.health@2.1-impl.recovery \
    bootctrl.$(PRODUCT_PLATFORM).recovery

PRODUCT_COPY_FILES += \
    $(OUT_DIR)/target/product/$(PRODUCT_RELEASE_NAME)/obj/SHARED_LIBRARIES/libandroidicu_intermediates/libandroidicu.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libandroidicu.so

# Copy modules for depmod
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/texfat.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/texfat.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/tntfs.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/tntfs.ko

# HIDL
PRODUCT_PACKAGES += \
    libhidltransport \
    libhwbinder

# qcom decryption
PRODUCT_PACKAGES_ENG += \
    qcom_decrypt \
    qcom_decrypt_fbe

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Include OEM keys for zip signature verification
PRODUCT_EXTRA_RECOVERY_KEYS += \
    $(LOCAL_PATH)/security/$(BOARD_VENDOR)1 \
    $(LOCAL_PATH)/security/$(BOARD_VENDOR)2 \
    $(LOCAL_PATH)/security/$(BOARD_VENDOR)3 \
    $(LOCAL_PATH)/security/$(BOARD_VENDOR)4
