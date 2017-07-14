#!/usr/bin/env bash


#echo "performance" >/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
#echo "performance" >/sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
#echo 2800000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
#echo 2800000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq

#    nvidia-smi -i ${i} -pm 0
#    nvidia-smi -i ${i} -pl 170
#    nvidia-smi -i ${i} -ac 4004,1911

#
# nvidia-overclock.sh
#
# Overclocking with nvidia-settings
#

RIG="rig2"

PERS=ENABLED

WATT="0"
CLOCK="150"

PROF="3"
MEM="1900"
#FAN="80"

#CMD='/usr/bin/nvidia-settings -c :0'
CMD='/usr/bin/nvidia-settings'

export DISPLAY=:0

# Graphics card 1 to 6
for DEVICE in {0..5}
do
	# Check if card exists
	if nvidia-smi -i $DEVICE >> /dev/null 2>&1; then
		# Set persistence mode: 0/DISABLED, 1/ENABLED
		nvidia-smi -i $DEVICE -pm $PERS
		# Specifies maximum power management limit in watts.
		nvidia-smi -i $DEVICE -pl $WATT
		${CMD} -a "[gpu:$DEVICE]/GPUPowerMizerMode=1"
		# Fan speed
		#${CMD} -a "[gpu:$DEVICE]/GPUFanControlState=1"
		#${CMD} -a "[fan:$DEVICE]/GPUTargetFanSpeed=$FAN"
		# Grafics clock
		${CMD} -a "[gpu:$DEVICE]/GPUGraphicsClockOffset[$PROF]=$CLOCK"
		# Memory clock
		${CMD} -a "[gpu:$DEVICE]/GPUMemoryTransferRateOffset[$PROF]=$MEM"
	fi
done

echo
echo "Done"
echo
