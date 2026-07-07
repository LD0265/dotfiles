#!/bin/bash
WALLPAPERS_DIR="$HOME/.config/wallpapers"

# Get sorted list of wallpapers
mapfile -t WALLS < <(find "$WALLPAPERS_DIR" -type f | sort)

# Get current wallpaper (adjust this command to whatever you use)
CURRENT=$(awww query | grep -oP 'image: \K.*')

# Find index of current wallpaper
CURRENT_IDX=-1
for i in "${!WALLS[@]}"; do
    if [[ "${WALLS[$i]}" == "$CURRENT" ]]; then
        CURRENT_IDX=$i
        break
    fi
done

# Pick next one, wrapping around
NEXT_IDX=$(( (CURRENT_IDX + 1) % ${#WALLS[@]} ))
NEW_WALL="${WALLS[$NEXT_IDX]}"

echo "$NEW_WALL"