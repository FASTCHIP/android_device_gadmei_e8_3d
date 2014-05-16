# hardware/libaudio-alsa/Android.mk
#
# Copyright 2008 Wind River Systems
#

ifeq ($(strip $(BOARD_USES_ALSA_AUDIO)),true)

  LOCAL_PATH := $(call my-dir)

  include $(CLEAR_VARS)

  LOCAL_ARM_MODE := arm
  LOCAL_CFLAGS := -D_POSIX_SOURCE

  LOCAL_C_INCLUDES += device/gadmei/e8_3d/alsa-lib/include

  LOCAL_SRC_FILES := \
	AudioHardwareALSA.cpp \
	AudioStreamOutALSA.cpp \
	AudioStreamInALSA.cpp \
	ALSAStreamOps.cpp \
	ALSAMixer.cpp \
	ALSAControl.cpp

  LOCAL_MODULE := audio.primary.amlogic
  LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
  LOCAL_MODULE_TAGS := optional

  LOCAL_STATIC_LIBRARIES += libmedia_helper
  LOCAL_WHOLE_STATIC_LIBRARIES := libaudiohw_legacy

  LOCAL_SHARED_LIBRARIES := \
    libasound \
    libcutils \
    libutils \
    libmedia \
    libhardware \
    libhardware_legacy \
    libc

ifeq ($(BOARD_HAVE_BLUETOOTH),true)
#  LOCAL_SHARED_LIBRARIES += liba2dp
endif

  include $(BUILD_SHARED_LIBRARY)

# This is the ALSA audio policy manager
ifeq (0,1)
  # Disabled because it doesn't do anything. Using
  # audio_policy.default.so from libhardware_legacy instead.
  include $(CLEAR_VARS)

  LOCAL_CFLAGS := -D_POSIX_SOURCE

ifeq ($(BOARD_HAVE_BLUETOOTH),true)
  LOCAL_CFLAGS += -DWITH_A2DP
endif

  LOCAL_SRC_FILES := AudioPolicyManagerALSA.cpp

  LOCAL_MODULE := libaudiopolicy

  LOCAL_STATIC_LIBRARIES := libmedia_helper
  LOCAL_WHOLE_STATIC_LIBRARIES += libaudiopolicy_legacy

  LOCAL_SHARED_LIBRARIES := \
    libcutils \
    libutils \
    libmedia

  include $(BUILD_SHARED_LIBRARY)
endif # 0,1

# This is the default ALSA module which behaves closely like the original

  include $(CLEAR_VARS)

  LOCAL_PRELINK_MODULE := false

  LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw

  LOCAL_CFLAGS := -D_POSIX_SOURCE -Wno-multichar

ifneq ($(ALSA_DEFAULT_SAMPLE_RATE),)
    LOCAL_CFLAGS += -DALSA_DEFAULT_SAMPLE_RATE=$(ALSA_DEFAULT_SAMPLE_RATE)
endif

  LOCAL_C_INCLUDES += device/gadmei/e8_3d/alsa-lib/include

  LOCAL_SRC_FILES:= alsa_default.cpp

  LOCAL_SHARED_LIBRARIES := \
  	libasound \
  	libcutils \
  	liblog

  LOCAL_MODULE_TAGS := optional
  LOCAL_MODULE:= alsa.default

  include $(BUILD_SHARED_LIBRARY)

# This is the default Acoustics module which is essentially a stub

  include $(CLEAR_VARS)

  LOCAL_PRELINK_MODULE := false

  LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw

  LOCAL_CFLAGS := -D_POSIX_SOURCE -Wno-multichar

  LOCAL_C_INCLUDES += device/gadmei/e8_3d/alsa-lib/include

  LOCAL_SRC_FILES:= acoustics_default.cpp

  LOCAL_SHARED_LIBRARIES := liblog

  LOCAL_MODULE_TAGS := optional
  LOCAL_MODULE:= acoustics.default

  include $(BUILD_SHARED_LIBRARY)

endif
