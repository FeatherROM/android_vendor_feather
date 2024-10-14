CUSTOM_DATE_YEAR := $(shell date -u +%Y)
CUSTOM_DATE_MONTH := $(shell date -u +%m)
CUSTOM_DATE_DAY := $(shell date -u +%d)
CUSTOM_DATE_HOUR := $(shell date -u +%H)
CUSTOM_DATE_MINUTE := $(shell date -u +%M)
FEATHER_BUILD_DATE_UTC := $(shell date -d '$(CUSTOM_DATE_YEAR)-$(CUSTOM_DATE_MONTH)-$(CUSTOM_DATE_DAY) $(CUSTOM_DATE_HOUR):$(CUSTOM_DATE_MINUTE) UTC' +%s)
FEATHER_BUILD_DATE := $(CUSTOM_DATE_YEAR)$(CUSTOM_DATE_MONTH)$(CUSTOM_DATE_DAY)-$(CUSTOM_DATE_HOUR)$(CUSTOM_DATE_MINUTE)

CUSTOM_PLATFORM_VERSION := 15

CUSTOM_VERSION := Feather_$(FEATHER_BUILD)-$(CUSTOM_PLATFORM_VERSION)-$(FEATHER_BUILD_DATE)
CUSTOM_VERSION_PROP := fifteen

# FeatherROM Platform Version
PRODUCT_PRODUCT_PROPERTIES += \
    ro.feather.build.date=$(BUILD_DATE) \
    ro.feather.device=$(FEATHER_BUILD) \
    ro.feather.fingerprint=$(ROM_FINGERPRINT) \
    ro.feather.version=$(CUSTOM_VERSION) \
    ro.modversion=$(CUSTOM_PLATFORM_VERSION)

# Signing
ifneq (eng,$(TARGET_BUILD_VARIANT))
ifneq (,$(wildcard vendor/feather/signing/keys/releasekey.pk8))
PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/feather/signing/keys/releasekey
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.oem_unlock_supported=1
endif
ifneq (,$(wildcard vendor/feather/signing/keys/otakey.x509.pem))
PRODUCT_OTA_PUBLIC_KEYS := vendor/feather/signing/keys/otakey.x509.pem
endif
endif
