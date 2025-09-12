#!/bin/bash

# Function to show power menu
show_power_menu() {
  local menu_options="\u200B  Lock
\u200C󰤄  sleep
\u200D  relaunch
\u2060󰜉  restart
󰐥\u2063  shutdown" # These first characters are invisible sort keys

  local selection=$(echo -e "$menu_options" | wofi --show dmenu --prompt "Power Options" --width 200 --height 250 -O alphabetical)

  case "$selection" in
  *Lock*) hyprlock ;;
  *sleep*) systemctl suspend ;;
  # *Relaunch*) hyprctl dispatch exit ;;
  *relaunch*) uwsm stop;;
  *restart*) systemctl reboot ;;
  *shutdown*) systemctl poweroff ;;
  esac
}

# Main execution
show_power_menu
