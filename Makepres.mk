LOCAL_PATH := $(call my-dir)

###################### libz ######################
include $(CLEAR_VARS)

LOCAL_MODULE := libz

LOCAL_PREMAKE_CONFIG_CMD := if [ ! -f $(LOCAL_PATH)/configure.log ]; then cd $(LOCAL_PATH); ./configure --prefix=$(TOPPREFIX)/premake/install; fi

LOCAL_PREMAKE_MAKE_CMD := -C $(LOCAL_PATH)

#LOCAL_PREMAKE_MAKE_ARGS := CC=$(HOME)/opt/toolschain/4.5.1/bin/arm-linux-gcc \
LDSHARED="$(HOME)/opt/toolschain/4.5.1/bin/arm-linux-gcc -shared -Wl,-soname,libz.so.1,--version-script,zlib.map" \
CPP="$(HOME)/opt/toolschain/4.5.1/bin/arm-linux-gcc -E" \
AR=$(HOME)/opt/toolschain/4.5.1/bin/arm-linux-ar \
RANLIB=$(HOME)/opt/toolschain/4.5.1/bin/arm-linux-ranlib

LOCAL_PREMAKE_MAKE_CLEAN_CMD := -C $(LOCAL_PATH) distclean

LOCAL_PREMAKE_MAKE_INSTALL_CMD := \
mkdir -p $(LOCAL_PATH)/out/lib; \
cp -fpd $(LOCAL_PATH)/*.a $(LOCAL_PATH)/*.so* $(LOCAL_PATH)/out/lib; \
mkdir -p $(LOCAL_PATH)/out/lib/pkgconfig; \
cp -fp $(LOCAL_PATH)/*.pc $(LOCAL_PATH)/out/lib/pkgconfig; \
mkdir -p $(LOCAL_PATH)/out/include; \
cp -fp $(LOCAL_PATH)/zlib.h $(LOCAL_PATH)/zconf.h $(LOCAL_PATH)/out/include

LOCAL_PREMAKE_MAKE_UNINSTALL_CMD := rm -rf $(LOCAL_PATH)/out

LOCAL_PREMAKE_INSTALL_SRC := $(LOCAL_PATH)/libz.a
LOCAL_PREMAKE_INSTALL_DST := $(addprefix $(LOCAL_PATH)/out/,$(notdir $(LOCAL_PREMAKE_INSTALL_SRC)))

#LOCAL_PREMAKE_DEPEND_MODULE := makec

include $(BUILD_SYSTEM)/premake.mk
