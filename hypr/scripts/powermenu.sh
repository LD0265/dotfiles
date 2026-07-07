#!/bin/bash
chosen=$(printf "Shutdown\nReboot\nSleep\nLogout" | wofi --dmenu --prompt "Power")

case $chosen in
    Shutdown) shutdown -h now ;;
    Reboot) reboot ;;
    Sleep) systemctl suspend ;;
    Logout) hyprctl dispatch exit ;;
esac