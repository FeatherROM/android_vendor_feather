# Inherit mobile full common stuff
$(call inherit-product, vendor/feather/config/common_mobile_full.mk)

# Inherit tablet common stuff
$(call inherit-product, vendor/feather/config/tablet.mk)

$(call inherit-product, vendor/feather/config/wifionly.mk)
