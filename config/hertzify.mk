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
PRODUCT_DEX_PREOPT_BOOT_IMAGE_PROFILE_LOCATION := frameworks/base/boot/boot-image-profile.txt
