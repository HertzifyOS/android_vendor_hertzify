# Caculator
PRODUCT_PACKAGES += \
    ExactCalculator

# Setup Wizard
PRODUCT_PACKAGES += \
    HertzifySetupWizard

# Updater
PRODUCT_PACKAGES += \
    Updater

PRODUCT_COPY_FILES += \
    vendor/hertzify/prebuilt/common/etc/init/init.hertzify-updater.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.hertzify-updater.rc
