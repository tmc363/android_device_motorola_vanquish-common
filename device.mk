$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product, device/motorola/msm8960-common/msm8960.mk)

LOCAL_PATH := device/motorola/vanquish-common

TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

#scripts
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/scripts/init.goldfish.sh:system/etc/init.goldfish.sh \
	$(LOCAL_PATH)/scripts/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
	$(LOCAL_PATH)/scripts/init.qcom.coex.sh:system/etc/init.qcom.coex.sh \
	$(LOCAL_PATH)/scripts/init.qcom.fm.sh:system/etc/init.qcom.fm.sh \
	$(LOCAL_PATH)/scripts/init.qcom.mdm_links.sh:system/etc/init.qcom.mdm_links.sh \
	$(LOCAL_PATH)/scripts/init.qcom.modem_links.sh:system/etc/init.qcom.modem_links.sh \
	$(LOCAL_PATH)/scripts/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
	$(LOCAL_PATH)/scripts/mount_pds.sh:system/bin/mount_pds.sh \
	$(LOCAL_PATH)/scripts/init.qcom.wifi.sh:system/etc/init.qcom.wifi.sh

#init
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/root/ueventd.qcom.rc:root/ueventd.qcom.rc \
	$(LOCAL_PATH)/root/init.mmi.usb.rc:root/init.mmi.usb.rc \
	$(LOCAL_PATH)/root/init.mmi.usb.sh:root/init.mmi.usb.sh \
	$(LOCAL_PATH)/root/init.msm.rc:root/init.msm.rc \
	$(LOCAL_PATH)/root/init.qcom.sh:root/init.qcom.sh \
	$(LOCAL_PATH)/root/init.qcom.class_core.sh:root/init.qcom.class_core.sh \
	$(LOCAL_PATH)/root/init.qcom.class_main.sh:root/init.qcom.class_main.sh \
	$(LOCAL_PATH)/root/init.qcom.rc:root/init.qcom.rc \
	$(LOCAL_PATH)/root/fstab.qcom:root/fstab.qcom \
	$(LOCAL_PATH)/root/init.target.rc:root/init.target.rc

#media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/config/media_profiles.xml:system/etc/media_profiles.xml \
	$(LOCAL_PATH)/config/media_codecs.xml:system/etc/media_codecs.xml

#audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/snd_soc_msm_2x:system/etc/snd_soc_msm/snd_soc_msm_2x

#config
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/config/vold.fstab:system/etc/vold.fstab

#wifi firmware
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/firmware/wlanprima/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
	$(LOCAL_PATH)/firmware/wlanprima/WCNSS_qcom_cfg.ini:system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
	$(LOCAL_PATH)/firmware/wlanprima/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin

PRODUCT_LOCALES := en_US
PRODUCT_LOCALES += xhdpi
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

#misc
PRODUCT_PROPERTY_OVERRIDES += \
	persist.fuse_sdcard=true \
	ro.usb.mtp_usbnet=0x2e32 \
	ro.usb.mtp_usbnet_adb=0x2e33 \
	ro.usb.cdrom=0x2e20 \
	ro.usb.ms=0x2e21 \
	ro.usb.ms_adb=0x2e22 \
	ro.usb.ptp=0x2e30 \
	ro.usb.ptp_adb=0x2e31 \
	ro.hdmi.enable=true \
	ro.product.model.exif=RAZR_HD

# QCOM Display
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=320 \
	debug.egl.hw=1 \
	debug.enabletr=1

# Radio and Telephony
PRODUCT_PROPERTY_OVERRIDES += \
	rild.libpath=/system/lib/libril-qc-qmi-1.so \
	rild.libargs=-d /dev/smd0 \
	persist.rild.nitz_plmn= \
	persist.rild.nitz_long_ons_0= \
	persist.rild.nitz_long_ons_1= \
	persist.rild.nitz_long_ons_2= \
	persist.rild.nitz_long_ons_3= \
	persist.rild.nitz_short_ons_0= \
	persist.rild.nitz_short_ons_1= \
	persist.rild.nitz_short_ons_2= \
	persist.rild.nitz_short_ons_3= \
	ril.subscription.types=NV,RUIM \
	keyguard.no_require_sim=true \
	ro.use_data_netmgrd=true \
	ro.ril.transmitpower=true \
	persist.radio.apm_sim_not_pwdn=1 \
	persist.radio.call_type=1 \
	persist.audio.fluence.mode=endfire \
	persist.audio.vr.enable=false \
	ro.qc.sdk.audio.fluencetype=fluence \
	persist.audio.handset.mic=digital \
	ro.config.vc_call_vol_steps=7 \
	persist.timed.enable=true

# IDC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/melfas-ts.idc:system/usr/idc/melfas-ts.idc \
    $(LOCAL_PATH)/idc/qwerty2.idc:system/usr/idc/qwerty2.idc \
    $(LOCAL_PATH)/idc/qwerty.idc:system/usr/idc/qwerty.idc \
    $(LOCAL_PATH)/idc/evfwd.idc:system/usr/idc/evfwd.idc

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
