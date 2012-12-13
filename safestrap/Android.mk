# Copyright 2005 The Android Open Source Project

# Build init compatabile with Second init boot
include $(all-subdir-makefiles)

LOCAL_PATH:= system/core/init
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
	builtins.c \
	init.c \
	devices.c \
	property_service.c \
	util.c \
	parser.c \
	logo.c \
	keychords.c \
	signal_handler.c \
	init_parser.c \
	ueventd.c \
	ueventd_parser.c \
	watchdogd.c

LOCAL_CFLAGS += -DBOARD_HAS_LOCKED_BOOTLOADER

LOCAL_CFLAGS += -DALLOW_LOCAL_PROP_OVERRIDE=1

ifneq ($(TARGET_NR_SVC_SUPP_GIDS),)
LOCAL_CFLAGS += -DNR_SVC_SUPP_GIDS=$(TARGET_NR_SVC_SUPP_GIDS)
endif

LOCAL_MODULE:= init2

LOCAL_MODULE_TAGS := optional

LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_MODULE_PATH := $(OUT)/fake_packages
LOCAL_UNSTRIPPED_PATH := $(TARGET_ROOT_OUT_UNSTRIPPED)

LOCAL_STATIC_LIBRARIES := libfs_mgr libcutils libc

ifeq ($(HAVE_SELINUX),true)
LOCAL_STATIC_LIBRARIES += libselinux
LOCAL_C_INCLUDES += external/libselinux/include
LOCAL_CFLAGS += -DHAVE_SELINUX
endif

include $(BUILD_EXECUTABLE)
