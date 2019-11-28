#!/bin/sh

max=`cat /sys/class/backlight/intel_backlight/max_brightness`
val=`cat /sys/class/backlight/intel_backlight/brightness`
dir=$1

five_percent=$(($max/20))

unset new_brightness
if [ "$dir" == "+" ] ; then
  echo 'old'
  new_brightness=$(($val+$five_percent))
  if [ $new_brightness -gt $max ] ; then
    new_brightness=$max
  fi
elif [ "$dir" == "-" ] ; then
  echo 'sent'
  new_brightness=$(($val-$five_percent))
  if [ $new_brightness -lt 1 ] ; then
    new_brightness=1
  fi
fi

echo $new_brightness > /sys/class/backlight/intel_backlight/brightness
