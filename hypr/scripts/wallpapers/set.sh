#!/bin/bash
set -eu

WALL=$1

awww img --transition-type none "$WALL"
echo "Wallpaper set successfully"
# --transition-type center --transition-step 90


if command -v wal >/dev/null 2>&1; then
    echo "applying pywal colors..."
    wal -i "$WALL"
    pkill -SIGWINCH fish
    echo "pywal applied successfully"
    "$HOME/.config/mako/update-colors.sh" &
    "$HOME/.config/keyboard/set-color-keyboard.sh" &
else
    echo "pywal not installed, skipping"
fi

