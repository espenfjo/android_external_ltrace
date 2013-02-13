LOCAL_PATH:= $(call my-dir)

###################### libssh ######################
include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := \
	breakpoints.c \
	debug.c \
	demangle.c \
	dict.c \
	display_args.c \
	ltrace-elf.c \
	execute_program.c \
	handle_event.c \
	libltrace.c \
	options.c \
	output.c \
	proc.c \
	read_config_file.c  \
	summary.c


#    openbsd-compat/getrrsetbyname.c
#    openbsd-compat/xcrypt.c 


LOCAL_STATIC_LIBRARIES += libelf
LOCAL_C_INCLUDES  += $(ANDROID_BUILD_TOP)/bionic/linker/
LOCAL_C_INCLUDES  += $(LOCAL_PATH)/sysdeps
LOCAL_C_INCLUDES  += $(LOCAL_PATH)/sysdeps/linux-gnu/arm/
LOCAL_C_INCLUDES  += $(LOCAL_PATH)/sysdeps/linux-gnu/
LOCAL_C_INCLUDES  += $(ANDROID_BUILD_TOP)/external/elfutils/libelf/

LOCAL_MODULE := ltrace

LOCAL_CFLAGS+=-O3

include $(BUILD_SHARED_LIBRARY)

