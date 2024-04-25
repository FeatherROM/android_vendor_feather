RELEASE_TYPE ?= community
RELEASE_DATE := $(shell date -u +%d%m%y)
RELEASE_DATE_UTC := $(shell date -u +%s)
AOSP_BASE := 14
FEATHER_RELEASE := Feather_$(FEATHER_DEVICE)-$(AOSP_BASE)-$(RELEASE_DATE)-$(RELEASE_TYPE)

