ifeq ($(TARGET_HW_DISK_ENCRYPTION),true)

LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    cryptfs_hw.c

LOCAL_C_INCLUDES := \
    hardware/libhardware/include/hardware/

LOCAL_SHARED_LIBRARIES := \
    libcutils \
    libutils \
    libdl \
    libhardware

LOCAL_MODULE := libcryptfs_hw
LOCAL_MODULE_OWNER := qcom
LOCAL_MODULE_TAGS := optional
LOCAL_PROPRIETARY_MODULE := true

ifeq ($(TARGET_SWV8_DISK_ENCRYPTION),true)
LOCAL_CFLAGS += -DCONFIG_SWV8_DISK_ENCRYPTION
endif

# USE_ICE_FOR_STORAGE_ENCRYPTION would be true in future if
# TARGET_USE_EMMC_USE_ICE is set
ifeq ($(TARGET_USE_UFS_ICE),true)
LOCAL_CFLAGS += -DUSE_ICE_FOR_STORAGE_ENCRYPTION
endif

include $(BUILD_SHARED_LIBRARY)

endif # TARGET_HW_DISK_ENCRYPTION
