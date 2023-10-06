#!/bin/bash

# Function to increase brightness using xrandr
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 [increase|decrease]"
  exit 1
fi

case "$1" in
  incr)
      brightnessctl set +5%
    ;;
  decr)
      brightnessctl set 5%-
    ;;
  *)
    echo "Invalid argument: $1 (Use 'increase' or 'decrease')"
    exit 1
    ;;
esac

