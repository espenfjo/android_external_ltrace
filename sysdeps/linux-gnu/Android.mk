LOCAL_PATH:= $(call my-dir)

###################### libssh ######################
include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := \
	events.c \
arm/trace.c \
	trace.c \
	proc.c \
	breakpoint.c


LOCAL_STATIC_LIBRARIES += libelf
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../
LOCAL_C_INCLUDES += $(LOCAL_PATH)/arm/
LOCAL_C_INCLUDES += $(ANDROID_BUILD_TOP)/external/elfutils/libelf/

LOCAL_MODULE := libos

LOCAL_CFLAGS+=-O3

include $(BUILD_SHARED_LIBRARY)

