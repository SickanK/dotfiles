#!/bin/bash
echo "What brightness do you want? (0 - 5022)"
read brightnessvar
> /sys/class/backlight/intel_backlight/brightness
echo $brightnessvar >> /sys/class/backlight/intel_backlight/brightness
