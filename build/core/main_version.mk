# Build fingerprint
ifeq ($(BUILD_FINGERPRINT),)
FEATHER_BUILD_NUMBER := $(shell date -u +%H%M)
CUSTOM_DEVICE ?= $(TARGET_DEVICE)
ifneq ($(filter OFFICIAL,$(RELEASE_TYPE)),)
BUILD_SIGNATURE_KEYS := release-keys
else
BUILD_SIGNATURE_KEYS := test-keys
endif
BUILD_FINGERPRINT := $(PRODUCT_BRAND)/$(CUSTOM_DEVICE)/$(CUSTOM_DEVICE):$(PLATFORM_VERSION)/$(BUILD_ID)/$(FEATHER_BUILD_NUMBER):$(TARGET_BUILD_VARIANT)/$(BUILD_SIGNATURE_KEYS)
endif
ADDITIONAL_SYSTEM_PROPERTIES  += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)

# AOSP recovery flashing
ifeq ($(TARGET_USES_AOSP_RECOVERY),true)
ADDITIONAL_SYSTEM_PROPERTIES  += \
    persist.sys.recovery_update=true
endif

# Versioning props
ADDITIONAL_SYSTEM_PROPERTIES  += \
    org.feather.version=$(AOSP_BASE) \
    org.feather.version.display=$(FEATHER_RELEASE) \
    org.feather.build_date=$(RELEASE_DATE) \
    org.feather.build_date_utc=$(RELEASE_DATE_UTC) \
    org.feather.build_type=$(RELEASE_TYPE)
