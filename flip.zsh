#!/bin/sh

output_name="eDP-1"
input_name="'Wacom HID 52A2 Finger'"

current_rotation=$(swaymsg -t get_outputs | grep "$output_name" -A100 | grep "transform" | awk '{print $2}')

echo "Output:" $output_name
echo "Input:" $input_name
echo "Current:" $current_rotation

if [ "$current_rotation" = "normal" ]; then
    swaymsg output "$output_name" transform 90
    swaymsg input "$input_name" map_to_output "$output_name"
    swaymsg input "$input_name" calibration_matrix "0 -1 1 1 0 0"
else
    swaymsg output "$output_name" transform normal
    swaymsg input "$input_name" map_to_output "$output_name"
    swaymsg input "$input_name" calibration_matrix "1 0 0 0 1 0"
fi