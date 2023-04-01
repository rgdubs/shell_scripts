#!/bin/zsh

output_name="eDP-1"
touchscreen_name="Wacom HID 52A2 Finger"

state=$(xrandr --query --verbose | grep -w "$output_name" | grep -oP '\d+x\d+\+\d+\+\d+\s+\K(normal|left)')

if [[ $state == "normal" ]]
then
    xrandr --output "$output_name" --rotate left
    sudo libinput debug-events --device /dev/input/event"$touchscreen_id" --enable-tap
else
    xrandr --output "$output_name" --rotate normal
    sudo libinput debug-events --device /dev/input/event"$touchscreen_id" --enable-tap
fi