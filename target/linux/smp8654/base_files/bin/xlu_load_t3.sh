#!/bin/sh
set -e
export SMP86XX_CHIP_FAMILY="t3iptv"
video_tag=0xba01
audio_tag=0xba02
demux_tag=0xba03
ios_tag=0xbada
export RUAFW_DIR=/lib/firmware
lrroxenv_location=0x61d00 #$(gbus_read_uint32 0x61a00)
lrroxenv_size=628
isprod="prod"

has_audio0=y
has_audio1=n
has_audio2=n
has_video0=y
has_video1=n
has_demux0=y
has_demux1=n
has_ipu=y
has_demux1=y

# sha1sum of the certificate plus the certID (last 2 digits)
cert12="83c4b39beb4963951e384fde4bc67e39d14b965810"
cert13="91cbeca790e94e119c3fd7fcfbcf6806dd27795311"
cert14="dc35da137bd6a684ab3bd8b18f3358d1f63b61c012"
cert15="d43069fc20bbac0913d298613374ad04cbef841013"
cert16="a7308012f5b4a6d83bf4acb3244f3aea796f774b14"
cert17="94b7504f25a1cc4ff3739457aed2aa44bf64e4b215"
cert18="14e5f8da47e42b3f6ec76910ba3af107b7c8df1c16"
cert19="6ff5bee67576692fc2d009a68e15c93dbddd7d5b17"
cert30="162eca23711250c05424008eb5e0f70042ac1f221c"
cert31="2873d573cb15ebb72e56eed700d93a7c3da8fe441d"

gbus_read_bin_to_file 0x61d00 0x274 /tmp/lrro.xenv
bc04=$(genxenv2 l /tmp/lrro.xenv 2>/dev/null | grep -e " bc04 " | sed -e's/.*bc04\s*//' | sed -e's/ *//g')
echo bc04 is $bc04
#johnson workaround:sigma smp8670 1018 dev board,bc04 is null
if [ x${bc04} == x ]; then
	bc04="2873d573cb15ebb72e56eed700d93a7c3da8fe44"
fi
echo bc04 is $bc04

SMP86XX_CHIP_CERTID="unknown"
stra=$cert12
echo stra is $stra
echo $stra > /tmp/certid
dd if=/tmp/certid of=/tmp/certid40 bs=1 count=40
dd if=/tmp/certid of=/tmp/certid42 bs=1 count=2 skip=40
strb=`cat /tmp/certid40`
echo strb is $strb
if [ x${bc04} == x$strb ]; then
	strc=`cat /tmp/certid42`
	export SMP86XX_CHIP_CERTID="0x${strc}"
	echo SMP86XX_CHIP_CERTID=$SMP86XX_CHIP_CERTID
fi

stra=$cert13
echo stra is $stra
echo $stra > /tmp/certid
dd if=/tmp/certid of=/tmp/certid40 bs=1 count=40
dd if=/tmp/certid of=/tmp/certid42 bs=1 count=2 skip=40
strb=`cat /tmp/certid40`
echo strb is $strb
if [ x${bc04} == x$strb ]; then
	strc=`cat /tmp/certid42`
	export SMP86XX_CHIP_CERTID="0x${strc}"
	echo SMP86XX_CHIP_CERTID=$SMP86XX_CHIP_CERTID
fi

stra=$cert14
echo stra is $stra
echo $stra > /tmp/certid
dd if=/tmp/certid of=/tmp/certid40 bs=1 count=40
dd if=/tmp/certid of=/tmp/certid42 bs=1 count=2 skip=40
strb=`cat /tmp/certid40`
echo strb is $strb
if [ x${bc04} == x$strb ]; then
	strc=`cat /tmp/certid42`
	export SMP86XX_CHIP_CERTID="0x${strc}"
	echo SMP86XX_CHIP_CERTID=$SMP86XX_CHIP_CERTID
fi

stra=$cert15
echo stra is $stra
echo $stra > /tmp/certid
dd if=/tmp/certid of=/tmp/certid40 bs=1 count=40
dd if=/tmp/certid of=/tmp/certid42 bs=1 count=2 skip=40
strb=`cat /tmp/certid40`
echo strb is $strb
if [ x${bc04} == x$strb ]; then
	strc=`cat /tmp/certid42`
	export SMP86XX_CHIP_CERTID="0x${strc}"
	echo SMP86XX_CHIP_CERTID=$SMP86XX_CHIP_CERTID
fi

stra=$cert16
echo stra is $stra
echo $stra > /tmp/certid
dd if=/tmp/certid of=/tmp/certid40 bs=1 count=40
dd if=/tmp/certid of=/tmp/certid42 bs=1 count=2 skip=40
strb=`cat /tmp/certid40`
echo strb is $strb
if [ x${bc04} == x$strb ]; then
	strc=`cat /tmp/certid42`
	export SMP86XX_CHIP_CERTID="0x${strc}"
	echo SMP86XX_CHIP_CERTID=$SMP86XX_CHIP_CERTID
fi

stra=$cert30
echo stra is $stra
echo $stra > /tmp/certid
dd if=/tmp/certid of=/tmp/certid40 bs=1 count=40
dd if=/tmp/certid of=/tmp/certid42 bs=1 count=2 skip=40
strb=`cat /tmp/certid40`
echo strb is $strb
if [ x${bc04} == x$strb ]; then
	strc=`cat /tmp/certid42`
	export SMP86XX_CHIP_CERTID="0x${strc}"
	echo SMP86XX_CHIP_CERTID=$SMP86XX_CHIP_CERTID
fi

stra=$cert31
echo stra is $stra
echo $stra > /tmp/certid
dd if=/tmp/certid of=/tmp/certid40 bs=1 count=40
dd if=/tmp/certid of=/tmp/certid42 bs=1 count=2 skip=40
strb=`cat /tmp/certid40`
echo strb is $strb
if [ x${bc04} == x$strb ]; then
	strc=`cat /tmp/certid42`
	export SMP86XX_CHIP_CERTID="0x${strc}"
	echo SMP86XX_CHIP_CERTID=$SMP86XX_CHIP_CERTID
fi

if [ ${SMP86XX_CHIP_CERTID} == "0x10" ]; then
	dts_label="0x10_nodts"
	real_label="noreal"
	echo dts = $dts_label
fi
if [ ${SMP86XX_CHIP_CERTID} == "0x11" ]; then
	dts_label="0x11_dts44"
	real_label="noreal"
	echo dts = $dts_label
fi
if [ ${SMP86XX_CHIP_CERTID} == "0x12" ]; then
	dts_label="0x12_dts42"
	real_label="noreal"
	echo dts = $dts_label
fi
if [ ${SMP86XX_CHIP_CERTID} == "0x13" ]; then
	dts_label="0x13_dts54"
	real_label="noreal"
	echo dts = $dts_label
fi
if [ ${SMP86XX_CHIP_CERTID} == "0x14" ]; then
	dts_label="0x14_dts52"
	real_label="noreal"
	echo dts = $dts_label
fi
if [ ${SMP86XX_CHIP_CERTID} == "0x15" ]; then
	dts_label="0x15_nodts"
	real_label="real"
	echo dts = $dts_label
fi
if [ ${SMP86XX_CHIP_CERTID} == "0x17" ]; then
	dts_label="0x17_dts54"
	real_label="real"
	echo dts = $dts_label
fi
if [ ${SMP86XX_CHIP_CERTID} == "0x18" ]; then
	dts_label="0x18_dts42"
	real_label="real"
	echo dts = $dts_label
fi
if [ ${SMP86XX_CHIP_CERTID} == "0x19" ]; then
	dts_label="0x19_dts52"
	real_label="real"
	echo dts = $dts_label
fi
if [ ${SMP86XX_CHIP_CERTID} == "0x1c" ]; then
	dts_label="0x1c_dts70"
	real_label="noreal"
	echo dts = $dts_label
fi
if [ ${SMP86XX_CHIP_CERTID} == "0x1d" ]; then
	dts_label="0x1d_dts70"
	real_label="noreal"
	echo dts = $dts_label
fi
if [ x$dts_label == "x" ]; then
	dts_label="dts"
	echo dts = $dts_label
fi

if [ ${dts_label} == "nodts" ]; then  
	echo "no dts"  
else  
	/bin/touch /tmp/has_dts 
fi  

DA=`rmmalloc 0 2340777`
echo Using scratch=$DA

echo Loading video ucode
xkc xload ${video_tag} ${RUAFW_DIR}/video_microcode_${SMP86XX_CHIP_FAMILY}_prod_${real_label}.xload $DA 0

echo Loading audio ucode
echo Loading audio_microcode_${SMP86XX_CHIP_FAMILY}_prod_$dts_label.xload
xkc xload ${audio_tag} ${RUAFW_DIR}/audio_microcode_${SMP86XX_CHIP_FAMILY}_prod_$dts_label.xload $DA 0

	if [ ${IS_DTCP} == "y" ]; then
		echo Loading xtask_drm_dtcp-1_5-t3_8644_ES1_prod_0007.xload
		xkc xload 0xd7cbd7cb /lib/xtask_drm_dtcp-1_5-t3_8644_ES1_prod_0007.xload $DA
	fi

if [ -e  ${RUAFW_DIR}/demuxpsf_microcode*.xload ]; then
	echo Loading demuxpsf ucode
	xkc xload ${demux_tag} ${RUAFW_DIR}/demuxpsf_microcode_${SMP86XX_CHIP_FAMILY}*.xload $DA 0
else
	echo "ERROR: I expected to see  ${RUAFW_DIR}/demuxpsf_microcode*.xload"
	exit 1
fi

rmfree 0 $DA

if [ "${has_demux0}" == "y" ]; then
	echo "Staring demux0..."
	xkc ustart ${demux_tag} d || (echo failed; exit 1)
fi
if [ "${has_demux1}" == "y" ]; then
	echo "Staring demux1..."
	xkc ustart ${demux_tag} D || (echo failed; exit 1)
fi
if [ "${has_video0}" == "y" ]; then
	echo "Staring video0..."
	xkc ustart ${video_tag} v || (echo failed; exit 1)
fi
if [ "${has_video1}" == "y" ]; then
	echo "Staring video1..."
	xkc ustart ${video_tag} V || (echo failed; exit 1)
fi
if [ "${has_audio0}" == "y" ]; then
	echo "Staring audio0..."
	xkc ustart ${audio_tag} a || (echo failed; exit 1)
fi
if [ "${has_audio1}" == "y" ]; then
	echo "Staring audio1..."
	xkc ustart ${audio_tag} A || (echo failed; exit 1;)
fi
if [ "${has_audio2}" == "y" ]; then
	echo "Staring audio2..."
	xkc ustart ${audio_tag} @ || (echo failed; exit 1)
fi

echo Loading ios
if [ -e  $RUAFW_DIR/ios.bin.gz*.xload ]; then
	xkc xload ${ios_tag} $RUAFW_DIR/ios.bin.gz_${SMP86XX_CHIP_FAMILY}*.xload 
else
	echo "ERROR, I expected to see $RUAFW_DIR/ios.bin.gz*.xload"
	exit 1
fi

if [ "${real_label}" == "real" ]; then
    enable_realvideo.sh;
fi
