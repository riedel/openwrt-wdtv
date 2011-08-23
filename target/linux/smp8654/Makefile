#
# Copyright (C) 2009-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

ARCH:=mipsel
BOARD:=smp8654
BOARDNAME:=WDTV
FEATURES:=targz
SUBTARGETS:=wdtv

CFLAGS := -Wall  -D_POSIX  -D_UNIX -DLINUX -DUNIX  -D__MIPSEL__ -D__EM86XX__ -mips32r2 -Wa,-mips32r2 -march=24kf -mtune=24kf -DEM86XX_CHIP=EM86XX_CHIPID_TANGO3 -DEM86XX_REVISION=3 -DDEMUX_PSF=1 -DXBOOT2_SMP865X=1 -DEM86XX_MODE=EM86XX_MODEID_STANDALONE -DWITH_XLOADED_UCODE=1 -DGCC4_TOOLCHAIN -ggdb -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE=1 -D_LARGEFILE64_SOURCE=1  -D__LITTLE_ENDIAN__ -O2
LDFLAGS:= -ggdb -W,l-melf32ltsmip 
COMPILKIND:=hardfloat glibc
export COMPILKIND

LINUX_VERSION:=2.6.22.19

DEVICE_TYPE=other

include $(INCLUDE_DIR)/target.mk

define Target/Description
	Build firmware images for WDTV smp8654 based boards.
endef

$(eval $(call BuildTarget))
