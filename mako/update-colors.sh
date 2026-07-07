#!/bin/bash
set -eu

CACHE_FILE="$HOME/.cache/wal/mako"
MAKO_CONFIG="$HOME/.config/mako/config"

[ -f "$CACHE_FILE" ] || exit 1

# Remove old generated block if present, then append fresh colors
sed -i '/^# BEGIN PYWAL/,/^# END PYWAL/d' "$MAKO_CONFIG"
{
    echo "# BEGIN PYWAL"
    cat "$CACHE_FILE"
    echo "# END PYWAL"
} >> "$MAKO_CONFIG"

makoctl reload
