#!/bin/bash

# Select wallpaper
selected=$(ls -1 ~/wallpaper | grep "jpg" | rofi -dmenu -p "Wallpapers")

if [ "$selected" ]; then

    echo "Changing theme..."
    # Update wallpaper with pywal
    wal -q -i ~/wallpaper/$selected

    # Wait for 1 sec
    sleep 1

    # Reload qtile to color bar
    qtile cmd-obj -o cmd -f reload_config

    # Get new theme
    source "$HOME/.cache/wal/colors.sh"

    newwall=$(echo $wallpaper | sed "s|$HOME/wallpaper/||g")

    # Send notification
    notify-send "Theme and Wallpaper updated" "With image $newwall"

    echo "Done."
fi
