# Caculator
PRODUCT_PACKAGES += \
    ExactCalculator

# Cloned app exemption
PRODUCT_COPY_FILES += \
    vendor/hertzify/prebuilt/common/etc/sysconfig/preinstalled-packages-platform-hertzify-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/preinstalled-packages-platform-hertzify-product.xml

# DeviceAsWebcam
ifeq ($(TARGET_BUILD_DEVICE_AS_WEBCAM), true)
    PRODUCT_PACKAGES += \
        DeviceAsWebcam

    PRODUCT_VENDOR_PROPERTIES += \
        ro.usb.uvc.enabled=true
endif

# Enable Material Design 3 Expressive
PRODUCT_PRODUCT_PROPERTIES += is_expressive_design_enabled=true

# Setup Wizard
PRODUCT_PACKAGES += \
    HertzifySetupWizard

# Updater
PRODUCT_PACKAGES += \
    Updater

PRODUCT_COPY_FILES += \
    vendor/hertzify/prebuilt/common/etc/init/init.hertzify-updater.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.hertzify-updater.rc

# Use a generic profile based boot image by default
PRODUCT_USE_PROFILE_FOR_BOOT_IMAGE := true
PRODUCT_COPY_FILES += \
    art/build/boot/preloaded-classes:$(TARGET_COPY_OUT_SYSTEM)/etc/preloaded-classes

PRODUCT_DEX_PREOPT_BOOT_IMAGE_PROFILE_LOCATION := \
    art/build/boot/boot-image-profile.txt

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/etc/preloaded-classes
