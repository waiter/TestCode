LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE    := fruit_match
LOCAL_C_INCLUDES := $(LOCAL_PATH)/ \
LOCAL_SRC_FILES := hello.cpp
LOCAL_WHOLE_STATIC_LIBRARIES  := testcode_static
include $(BUILD_SHARED_LIBRARY)


$(call import-module,TestCode)