#!/bin/bash
# # Increase volume by 5%, but cap it at 100%
# current_volume=$(pactl list sinks | grep 'Volume:' | head -n 1 | awk -F/ '{print $2}' | sed 's/[^0-9]*//g')
# new_volume=$((current_volume + 5))

# # Ensure the new volume doesn't exceed 100%
# if [ "$new_volume" -gt 100 ]; then
#   new_volume=100
# fi

# pactl set-sink-volume @DEFAULT_SINK@ "$new_volume"% 

#!/bin/bash

# Function to get the current volume percentage
#!/bin/bash

# Function to check if the sink is currently muted
is_muted() {
  pactl list sinks | grep -q 'Mute: yes'
}

# Function to toggle mute/unmute
toggle_mute() {
  if is_muted; then
    pactl set-sink-mute @DEFAULT_SINK@ 0  # Unmute
  else
    pactl set-sink-mute @DEFAULT_SINK@ 1  # Mute
  fi
}

# Function to adjust volume
adjust_volume() {
  local change_amount="$1"
  local current_volume
  current_volume=$(get_current_volume)

  if [ "$2" == "mute" ]; then
    toggle_mute
  else
    new_volume=$((current_volume + change_amount))

    # Ensure the new volume doesn't exceed 100%
    if [ "$new_volume" -gt 150 ]; then
      new_volume=150
    elif [ "$new_volume" -lt 0 ]; then
      new_volume=0
    fi

    pactl set-sink-volume @DEFAULT_SINK@ "$new_volume%"
    pactl set-sink-mute @DEFAULT_SINK@ 0
  fi
}

# Function to get the current volume percentage
get_current_volume() {
  pactl list sinks | grep 'Volume:' | head -n 1 | awk -F/ '{print $2}' | sed 's/[^0-9]*//g'
}

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 [increase|decrease|mute]"
  exit 1
fi

case "$1" in
  increase)
    adjust_volume 5
    ;;
  decrease)
    adjust_volume -5
    ;;
  mute)
    adjust_volume 0 mute
    ;;
  *)
    echo "Invalid argument: $1 (Use 'increase', 'decrease', or 'mute')"
    exit 1
    ;;
esac

