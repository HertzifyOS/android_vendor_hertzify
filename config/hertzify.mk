# Caculator
PRODUCT_PACKAGES += \
    ExactCalculator

# Cloned app exemption
PRODUCT_COPY_FILES += \
    vendor/hertzify/prebuilt/common/etc/sysconfig/preinstalled-packages-platform-hertzify-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/preinstalled-packages-platform-hertzify-product.xml

# Setup Wizard
PRODUCT_PACKAGES += \
    HertzifySetupWizard

# Updater
PRODUCT_PACKAGES += \
    Updater

PRODUCT_COPY_FILES += \
    vendor/hertzify/prebuilt/common/etc/init/init.hertzify-updater.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.hertzify-updater.rc
