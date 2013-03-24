LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE := testcode_static

LOCAL_MODULE_FILENAME := libtestcode

LOCAL_SRC_FILES := \
Audio/AudioManager.cpp \
Support/zip_support/ioapi.c \
Support/zip_support/unzip.c \
Commons/TCCommon.cpp \
Platform/JNI/JNIHelper.cpp \

LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/ \
                           $(LOCAL_PATH)/Audio \
                           $(LOCAL_PATH)/Commons \
                           $(LOCAL_PATH)/zlib \
                           $(LOCAL_PATH)/Support/zip_support \
                           $(LOCAL_PATH)/Platform \
						   $(LOCAL_PATH)/Platform/Android/ \
						   $(LOCAL_PATH)/Platform/JNI/ \

LOCAL_EXPORT_LDLIBS := -llog\
                       -lz \
                       -lGLESv1_CM

LOCAL_C_INCLUDES := $(LOCAL_PATH)/ \
                    $(LOCAL_PATH)/Audio \
                    $(LOCAL_PATH)/Commons \
                    $(LOCAL_PATH)/zlib \
                    $(LOCAL_PATH)/Support/zip_support \
                    $(LOCAL_PATH)/Platform \
					$(LOCAL_PATH)/Platform/Android/ \
					$(LOCAL_PATH)/Platform/JNI/ \

LOCAL_LDLIBS := -lGLESv1_CM \
                -llog \
                -lz 
LOCAL_WHOLE_STATIC_LIBRARIES  := testcode_libpng_static
LOCAL_WHOLE_STATIC_LIBRARIES += openal_static


LOCAL_CFLAGS := -DUSE_FILE32API \
                -D_STLP_USE_NEWALLOC \

include $(BUILD_STATIC_LIBRARY)



###################################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := testcode_shared

LOCAL_MODULE_FILENAME := libtestcode

LOCAL_SRC_FILES := \
Audio/AudioManager.cpp \
Commons/TCCommon.cpp \
Core/Math/TCAnimationCurve.cpp \
Core/Math/TCHermiteInterpolation3.cpp \
Core/Math/TCMatrix3x3.cpp \
Core/Math/TCRandom.cpp \
Core/AutoReleaseObject.cpp \
Core/AutoReleasePool.cpp \
Core/TCTime.cpp \
Engine2D/ParticleSystem/TCParticleSystem.cpp \
Engine2D/Render/TCPaint.cpp \
Engine2D/Render/TCSceneRenderer.cpp \
Engine2D/Scene/BaseNode.cpp \
Engine2D/Scene/BaseComponent.cpp \
Engine2D/Scene/TCAnimation.cpp \
Engine2D/Scene/TCDrawer.cpp \
Engine2D/Scene/TCSceneManager.cpp \
Engine2D/Scene/TCSprite.cpp \
Engine2D/Scene/TCTouchComponent.cpp \
Engine2D/Scene/TCTransform.cpp \
Engine2D/Texture/TCTexture.cpp \
Engine2D/Texture/TextureRegion.cpp \
OpenGL/TCRender.cpp \
Platform/JNI/JNIHelper.cpp \
Platform/TCScreen.cpp \
Platform/TCApplication_android.cpp \
Resources/TCBitmap.cpp \
Resources/TCFileUtils.cpp \
Resources/TCPngUtils.cpp \
Resources/TCResources.cpp \
Resources/TCTexturePackerUtil.cpp \
Resources/TCTextureRegionManager.cpp \
Support/json/lib_json/json_reader.cpp \
Support/json/lib_json/json_value.cpp \
Support/json/lib_json/json_writer.cpp \
Support/zip_support/ioapi.c \
Support/zip_support/unzip.c \









LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/ \
                           $(LOCAL_PATH)/Audio \
                           $(LOCAL_PATH)/Commons \
						   $(LOCAL_PATH)/Core \
						   $(LOCAL_PATH)/Core/Math \
                           $(LOCAL_PATH)/zlib \
                           $(LOCAL_PATH)/Support/zip_support \
                           $(LOCAL_PATH)/Platform \
						   $(LOCAL_PATH)/Platform/Android/ \
                           $(LOCAL_PATH)/Platform/JNI/ \
						   $(LOCAL_PATH)/OpenGL/ \
						   $(LOCAL_PATH)/Engine2D \
						   $(LOCAL_PATH)/Engine2D/Render \
						   $(LOCAL_PATH)/Engine2D/Scene \
						   $(LOCAL_PATH)/Engine2D/Animation \
						   $(LOCAL_PATH)/Engine2D/ParticleSystem \
						   $(LOCAL_PATH)/Engine2D/Texture \
						   $(LOCAL_PATH)/Engine2D/Touch \
						   $(LOCAL_PATH)/Resources \
						   $(LOCAL_PATH)/Support \
						   $(LOCAL_PATH)/Support/json/include \
						   $(LOCAL_PATH)/Support/openal \
						   $(LOCAL_PATH)/Support/zip_support \
						   $(LOCAL_PATH)/GameApp \

LOCAL_EXPORT_LDLIBS := -llog\
                       -lz \
                       -lGLESv1_CM
LOCAL_C_INCLUDES := $(LOCAL_PATH)/ \
                           $(LOCAL_PATH)/Audio \
                           $(LOCAL_PATH)/Commons \
						   $(LOCAL_PATH)/Core \
						   $(LOCAL_PATH)/Core/Math \
                           $(LOCAL_PATH)/zlib \
                           $(LOCAL_PATH)/Support/zip_support \
                           $(LOCAL_PATH)/Platform \
						   $(LOCAL_PATH)/Platform/Android/ \
						   $(LOCAL_PATH)/Platform/JNI/ \
						   $(LOCAL_PATH)/OpenGL/ \
						   $(LOCAL_PATH)/Engine2D \
						   $(LOCAL_PATH)/Engine2D/Render \
						   $(LOCAL_PATH)/Engine2D/Scene \
						   $(LOCAL_PATH)/Engine2D/Animation \
						   $(LOCAL_PATH)/Engine2D/ParticleSystem \
						   $(LOCAL_PATH)/Engine2D/Texture \
						   $(LOCAL_PATH)/Engine2D/Touch \
						   $(LOCAL_PATH)/Resources \
						   $(LOCAL_PATH)/Support \
						   $(LOCAL_PATH)/Support/json/include \
						   $(LOCAL_PATH)/Support/openal \
						   $(LOCAL_PATH)/Support/zip_support \
						   $(LOCAL_PATH)/GameApp \


LOCAL_LDLIBS := -lGLESv1_CM \
                -llog \
                -lz 
LOCAL_WHOLE_STATIC_LIBRARIES  := testcode_libpng_static
LOCAL_WHOLE_STATIC_LIBRARIES  += openal_static

LOCAL_CFLAGS := -DUSE_FILE32API \
                -D_STLP_USE_NEWALLOC \

include $(BUILD_SHARED_LIBRARY)

$(call import-module,libpng)
$(call import-module,libopenal)
