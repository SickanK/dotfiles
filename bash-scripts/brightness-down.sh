#!/bin/bash
brightnessvar=`cat /sys/class/backlight/intel_backlight/brightness`
#> /sys/class/backlight/intel_backlight/brightness
if [ "$brightnessvar" > 0 ];
then
    brightnessvar=$(($brightnessvar - 50));
fi
echo $brightnessvar >> /sys/class/backlight/intel_backlight/brightness
