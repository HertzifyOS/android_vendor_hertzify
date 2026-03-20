# Inherit common mobile Hertzify stuff
$(call inherit-product, vendor/hertzify/config/common.mk)

# Include AOSP audio files
$(call inherit-product-if-exists, frameworks/base/data/sounds/AudioPackage14.mk)
include vendor/hertzify/config/aosp_audio.mk

ifneq ($(WITH_GMS), true)
# Default notification/alarm sounds
PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.notification_sound=Popcorn.ogg \
    ro.config.alarm_alert=Bright_morning.ogg
endif

# Apps
PRODUCT_PACKAGES += \
    AvatarPicker \
    LatinIME

PRODUCT_PACKAGES += \
    Launcher3QuickStep

PRODUCT_DEXPREOPT_SPEED_APPS += \
    Launcher3QuickStep

# Media
PRODUCT_PRODUCT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

# SystemUI plugins
PRODUCT_PACKAGES += \
    QuickAccessWallet

# TextClassifier
PRODUCT_PACKAGES += \
    libtextclassifier_annotator_en_model \
    libtextclassifier_annotator_universal_model \
    libtextclassifier_actions_suggestions_universal_model \
    libtextclassifier_lang_id_model

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/etc/textclassifier/actions_suggestions.universal.model \
    system/etc/textclassifier/lang_id.model \
    system/etc/textclassifier/textclassifier.en.model \
    system/etc/textclassifier/textclassifier.universal.model

# Themes
PRODUCT_PACKAGES += \
    ThemePicker \
    ThemesStub
