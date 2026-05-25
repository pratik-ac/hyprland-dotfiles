#!/bin/bash
# lid-lock.sh

# Check if an external monitor is connected
EXT_MON=$(hyprctl monitors | grep -v eDP-1 | grep "Monitor" || true)

if [ -n "$EXT_MON" ]; then
    # External monitor exists: disable laptop screen and lock
    hyprctl keyword monitor "eDP-1, disable"
    sleep 0.2
    hyprlock -a
else
    # No external monitor: just lock the laptop screen
    hyprlock
fi
