LOCAL_PATH := $(call my-dir)

###################### libz ######################
include $(CLEAR_VARS)

LOCAL_MODULE := libz

LOCAL_PREMAKE_CONFIG_FILE := configure
LOCAL_PREMAKE_CONFIG_ARGS := --prefix=$(HOME)/opt/arm
LOCAL_PREMAKE_CONFIG_ST := $(LOCAL_PATH)/configure.log

LOCAL_PREMAKE_MAKE_FILE := Makefile
LOCAL_PREMAKE_MAKE_DIR := $(LOCAL_PATH)

LOCAL_PREMAKE_MAKE_TARGET := all
#LOCAL_PREMAKE_MAKE_ARGS := CC=$(HOME)/opt/toolschain/4.5.1/bin/arm-linux-gcc \
LDSHARED="$(HOME)/opt/toolschain/4.5.1/bin/arm-linux-gcc -shared -Wl,-soname,libz.so.1,--version-script,zlib.map" \
CPP="$(HOME)/opt/toolschain/4.5.1/bin/arm-linux-gcc -E" \
AR=$(HOME)/opt/toolschain/4.5.1/bin/arm-linux-ar \
RANLIB=$(HOME)/opt/toolschain/4.5.1/bin/arm-linux-ranlib

LOCAL_PREMAKE_MAKE_CLEAN := distclean

LOCAL_PREMAKE_DEPEND_MODULE := makec

include $(BUILD_SYSTEM)/premake.mk
