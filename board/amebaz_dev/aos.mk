NAME := board_amebaz_dev

JTAG := jlink_swd

$(NAME)_MBINS_TYPE := kernel
$(NAME)_VERSION    := 1.0.0
$(NAME)_SUMMARY    := configuration for board amabaz_dev

MODULE               := AmebaZ
HOST_ARCH            := Cortex-M4
HOST_MCU_FAMILY      := mcu_rtl8710bn
SUPPORT_MBINS        := no

$(NAME)_COMPONENTS += $(HOST_MCU_FAMILY) init

$(NAME)_SOURCES := board.c

GLOBAL_INCLUDES += .
GLOBAL_DEFINES  += STDIO_UART=0

CONFIG_SYSINFO_PRODUCT_MODEL := ALI_AOS_RTL8710BN
CONFIG_SYSINFO_DEVICE_NAME   := RTL8710BN


GLOBAL_CFLAGS += -DSYSINFO_PRODUCT_MODEL=\"$(CONFIG_SYSINFO_PRODUCT_MODEL)\"
GLOBAL_CFLAGS += -DSYSINFO_DEVICE_NAME=\"$(CONFIG_SYSINFO_DEVICE_NAME)\"
#GLOBAL_CFLAGS += -DSYSINFO_APP_VERSION=\"$(CONFIG_SYSINFO_APP_VERSION)\"
#include $(SOURCE_ROOT)/board/rtl8710bn/export-rom_symbol_v01.txt

GLOBAL_CFLAGS += -L $($(NAME)_LOCATION)


# Extra build target include bootloader, and copy output file to eclipse debug file (copy_output_for_eclipse)
EXTRA_TARGET_MAKEFILES +=  $($(HOST_MCU_FAMILY)_LOCATION)/download.mk
EXTRA_TARGET_MAKEFILES +=  $($(HOST_MCU_FAMILY)_LOCATION)/gen_crc_bin.mk
