LOCAL_PATH := $(call my-dir)

arm_target_info_TBLGEN_TABLES := \
  ARMGenSubtargetInfo.inc \
  ARMGenRegisterInfo.inc \
  ARMGenInstrInfo.inc

arm_target_info_SRC_FILES := \
  ARMTargetInfo.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS)

TBLGEN_TABLES := $(arm_target_info_TBLGEN_TABLES)

TBLGEN_TD_DIR := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(arm_target_info_SRC_FILES)

LOCAL_C_INCLUDES +=	\
	$(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVMARMInfo

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM_HOST_BUILD_MK)
include $(LLVM_TBLGEN_RULES_MK)
include $(LLVM_GEN_ATTRIBUTES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS)

TBLGEN_TABLES := $(arm_target_info_TBLGEN_TABLES)

TBLGEN_TD_DIR := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(arm_target_info_SRC_FILES)

LOCAL_C_INCLUDES +=	\
	$(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVMARMInfo

include $(LLVM_DEVICE_BUILD_MK)
include $(LLVM_TBLGEN_RULES_MK)
include $(LLVM_GEN_ATTRIBUTES_MK)
include $(BUILD_STATIC_LIBRARY)
endif
