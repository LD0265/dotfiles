#!/bin/bash
set -eu
CACHE_FILE="$HOME/.cache/wal/mako"
BASE_CONFIG="$HOME/.config/mako/config-base"
MAKO_CONFIG="$HOME/.config/mako/config"

[ -f "$CACHE_FILE" ] || exit 1
[ -f "$BASE_CONFIG" ] || exit 1

cat "$BASE_CONFIG" "$CACHE_FILE" > "$MAKO_CONFIG"

makoctl reload
