# Inherit device configuration for N70.
$(call inherit-product, device/gadmei/e8_3d/full_e8_3d.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)
$(call inherit-product, vendor/cm/config/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cm_e8_3d
PRODUCT_BRAND := DOTPAD
PRODUCT_DEVICE := e8_3d
PRODUCT_MODEL := NEO3DO
PRODUCT_MANUFACTURER := Gadmei
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=E8-3D TARGET_DEVICE=E8-3D BUILD_FINGERPRINT="DOTPAD/E8-3D/E8-3D:4.1.1/JRO03C/20131214.v005:user/release-keys" PRIVATE_BUILD_DESC="E8-3D-user 4.1.1 JRO03C 20131214.v005 release-keys"
# PRODUCT_BRAND := Google
# PRODUCT_MODEL := Nexus 7
# PRODUCT_MANUFACTURER := Asus
# PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=nakasi TARGET_DEVICE=grouper BUILD_FINGERPRINT="google/nakasi/grouper:4.1.2/JZO54K/485486:user/release-keys" PRIVATE_BUILD_DESC="nakasi-user 4.1.2 JZO54K 485486 release-keys"
