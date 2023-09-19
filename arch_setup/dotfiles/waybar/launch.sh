#!/bin/sh

# ----------------------------------------------------- 
# Quit running waybar instances
# ----------------------------------------------------- 
killall waybar

waybar &
notify-send "DONE"
