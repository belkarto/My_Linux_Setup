#!/bin/sh

killall waybar

waybar &
notify-send "Restart WAYBAR"
