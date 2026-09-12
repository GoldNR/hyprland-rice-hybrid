#!/usr/bin/env bash

SOCKET="/tmp/mpvpaper-socket"
HYPR_SOCKET="$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"

paused=""

set_pause() {
    local value="$1"

    printf '{ "command": ["set_property", "pause", %s] }\n' "$value" |
        socat - "$SOCKET" >/dev/null 2>&1
}

update_pause() {
    local fullscreen

    fullscreen=$(hyprctl activewindow -j 2>/dev/null |
        jq -r '.fullscreen // 0')

    if [[ "$fullscreen" != "0" && "$paused" != "1" ]]; then
        set_pause true
        paused="1"
    elif [[ "$fullscreen" == "0" && "$paused" == "1" ]]; then
        set_pause false
        paused="0"
    fi
}

if [[ ! -S "$HYPR_SOCKET" ]]; then
    echo "Hyprland event socket not found:" >&2
    echo "  $HYPR_SOCKET" >&2
    exit 1
fi

# Get the initial state.
update_pause

# Wait for Hyprland events.
while IFS= read -r event; do
    case "$event" in
        activewindow\>\>*|fullscreen\>\>*)
            update_pause
            ;;
    esac
done < <(
    socat -u "UNIX-CONNECT:$HYPR_SOCKET" -
)
