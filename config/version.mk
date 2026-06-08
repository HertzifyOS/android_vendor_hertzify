ANDROID_VERSION := 16
HERTZIFY_BUILD_VERSION := 1.8
HERTZIFY_BUILD_TYPE ?= UNOFFICIAL
HERTZIFY_MAINTAINER ?= UNKNOWN
HERTZIFY_DATE_YEAR := $(shell date -u +%Y)
HERTZIFY_DATE_MONTH := $(shell date -u +%m)
HERTZIFY_DATE_DAY := $(shell date -u +%d)
HERTZIFY_BUILD_DATE := $(HERTZIFY_DATE_YEAR)$(HERTZIFY_DATE_MONTH)$(HERTZIFY_DATE_DAY)

ifeq ($(WITH_GMS), true)
  HERTZIFY_BUILD_VARIANT := GAPPS
else
  HERTZIFY_BUILD_VARIANT := VANILLA
endif

# OFFICIAL_DEVICES
ifeq ($(HERTZIFY_BUILD_TYPE), OFFICIAL)
  LIST = $(shell cat OTA/devices/hertzify.devices)
    ifeq ($(filter $(HERTZIFY_BUILD), $(LIST)), $(HERTZIFY_BUILD))
      IS_OFFICIAL=true
      HERTZIFY_BUILD_TYPE := OFFICIAL
    endif
    ifneq ($(IS_OFFICIAL), true)
      HERTZIFY_BUILD_TYPE := UNOFFICIAL
      $(error Device is not official "$(HERTZIFY_BUILD)")
    endif
endif

HERTZIFY_VERSION := HertzifyOS-$(HERTZIFY_BUILD_VERSION)-$(HERTZIFY_BUILD)-$(HERTZIFY_BUILD_DATE)-$(HERTZIFY_BUILD_TYPE)-$(HERTZIFY_BUILD_VARIANT)

# HertzifyOS System Version
PRODUCT_PRODUCT_PROPERTIES += \
    ro.hertzify.version=$(HERTZIFY_VERSION) \
    ro.hertzify.device=$(HERTZIFY_BUILD) \
    ro.hertzify.maintainer=$(HERTZIFY_MAINTAINER) \
    ro.hertzify.build.version=$(HERTZIFY_BUILD_VERSION) \
    ro.hertzify.build.type=$(HERTZIFY_BUILD_TYPE) \
    ro.hertzify.build.date=$(HERTZIFY_BUILD_DATE) \
    ro.hertzify.build.variant=$(HERTZIFY_BUILD_VARIANT)