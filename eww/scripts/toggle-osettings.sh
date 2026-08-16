#!/usr/bin/bash
cd ~/.config/eww || exit

reserves=$(hyprctl monitors -j | gojq -r -c '.[0]["reserved"]')
if [[ "$1" == "--keypress" && "$reserves" == "[0,0,0,50]" ]]; then
    scripts/toggle-winnews.sh
    exit
fi


state=$(eww get rev_ostg)

if [[ "$state" == "true" || "$1" == "--close" ]]; then
    eww update anim_open_ostg=false
    eww update rev_ostg=false
    eww update audio_dropdown_open=false
    sleep 0.15
    eww close osettings 2>/dev/null
    eww update oquery=''
else # state = false
    scripts/close-other-widgets.sh osettings
    sink="$(wpctl status | awk '/Sinks:/{f=1} /Sources:/{f=0} f&&/\*/&&/[0-9]+\./{line=$0; sub(/^[^0-9]*/,"",line); sub(/^[0-9]+\.[ \t]*/,"",line); sub(/[ \t]*\[vol:.*$/,"",line); print line; exit}')"
    sinks=$("scripts/list-audio-sinks.sh")
    eww update current_sink="$sink" audio_sinks="$sinks"
    eww update anim_open_ostg=true
    eww update oquery='' &
    eww open osettings
    eww update rev_ostg=true &
fi
