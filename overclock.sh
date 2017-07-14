#! /bin/bash
#CLOCK=0
MEM=1500
CMD='/usr/bin/nvidia-settings'

export DISPLAY=:0

#echo "performance" >/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
#echo "performance" >/sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
#echo 2800000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
#echo 2800000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq

for i in {0..5}
  do
    nvidia-smi -i ${i} -pm 0
#    nvidia-smi -i ${i} -pl 170
#    nvidia-smi -i ${i} -ac 4004,1911
#    ${CMD} -c :0 -a [gpu:${i}]/GPUPowerMizerMode=1
#    ${CMD} -c :0 -a [gpu:${i}]/GPUFanControlState=1
#    ${CMD} -c :0 -a [fan:${i}]/GPUTargetFanSpeed=80

    for x in {3..3}
      do
        #${CMD} -c :0 -a [gpu:${i}]/GPUGraphicsClockOffset[${x}]=${CLOCK}
        ${CMD} -c :0 -a [gpu:${i}]/GPUMemoryTransferRateOffset[${x}]=${MEM}
    done
done
