THIS_DIR := $(call my-dir)

include $(REACT_ANDROID_DIR)/Android-prebuilt.mk

# If you wish to add a custom TurboModule or Fabric component in your app you
# will have to include the following autogenerated makefile.
# include $(GENERATED_SRC_DIR)/codegen/jni/Android.mk
include $(CLEAR_VARS)

LOCAL_PATH := $(THIS_DIR)

# You can customize the name of your application .so file here.
LOCAL_MODULE := fire_appmodules

LOCAL_C_INCLUDES := $(LOCAL_PATH)
LOCAL_SRC_FILES := $(wildcard $(LOCAL_PATH)/*.cpp)
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)

# If you wish to add a custom TurboModule or Fabric component in your app you
# will have to uncomment those lines to include the generated source 
# files from the codegen (placed in $(GENERATED_SRC_DIR)/codegen/jni)
#
# LOCAL_C_INCLUDES += $(GENERATED_SRC_DIR)/codegen/jni
# LOCAL_SRC_FILES += $(wildcard $(GENERATED_SRC_DIR)/codegen/jni/*.cpp)
# LOCAL_EXPORT_C_INCLUDES += $(GENERATED_SRC_DIR)/codegen/jni

# Here you should add any native library you wish to depend on.
LOCAL_SHARED_LIBRARIES := \
  libfabricjni \
  libfbjni \
  libfolly_futures \
  libfolly_json \
  libglog \
  libjsi \
  libreact_codegen_rncore \
  libreact_debug \
  libreact_nativemodule_core \
  libreact_render_componentregistry \
  libreact_render_core \
  libreact_render_debug \
  libreact_render_graphics \
  librrc_view \
  libruntimeexecutor \
  libturbomodulejsijni \
  libyoga

LOCAL_CFLAGS := -DLOG_TAG=\"ReactNative\" -fexceptions -frtti -std=c++17 -Wall

include $(BUILD_SHARED_LIBRARY)
