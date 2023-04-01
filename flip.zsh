#!/bin/zsh
# Flip the screen and the touchscreen from lanscape to portrait then back
# Using sway wm 

output_name="eDP-1"
input_name="Wacom HID 52A2 Finger"

current_rotation=$(swaymsg -t get_outputs | grep "$output_name" -A100 | grep "transform" | awk '{print $2}'| tr -d ',')

echo "Output:" $output_name
echo "Input:" $input_name
echo "Current:" $current_rotation

if [[ "$current_rotation" = *normal* ]]; then
    swaymsg input "\"$input_name\"" map_to_output "$output_name"
    swaymsg output "$output_name" transform 90
else
    swaymsg input "\"$input_name\"" map_to_output "$output_name"
    swaymsg output "$output_name" transform normal
fi