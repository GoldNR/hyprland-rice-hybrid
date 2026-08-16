#!/usr/bin/env bash

current="$1"

if [[ "$current" != "osettings" ]]; then
    (
        eww update anim_open_ostg=false
        eww update rev_ostg=false
        eww update audio_dropdown_open=false
        sleep 0.15
        eww close osettings 2>/dev/null
        eww update oquery=''
    ) &
fi

if [[ "$current" != "music" ]]; then
    (
        eww update anim_open_music=false
        eww update music_open=false
        sleep 0.2
        eww close music 2>/dev/null
        eww update cavajson=''
    ) &
fi

if [[ "$current" != "overview" ]]; then
    (
        eww close overview-dimmer
        eww close overview 2>/dev/null
        eww update overview_query=''
        eww update open_overview=false
    ) &
fi

if [[ "$current" != "themer" ]]; then
    (
        eww update anim_open_themer=false
        eww update rev_themer=false
        sleep 0.25
        eww close themer 2>/dev/null
    ) &
fi

if [[ "$current" != "onotify" ]]; then
    (
        eww update anim_open_ontf=false
        eww update rev_ontf=false
        sleep 0.15
        eww close onotify 2>/dev/null
    ) &
fi

if [[ "$current" != "bottombar" ]]; then
    (
        eww update anim_open_bottombar=false
        eww update rev_bottombar=false
        sleep 0.15
        eww close bottombar 2>/dev/null
        eww close bottombar-back 2>/dev/null
        eww update cavajson=''
    ) &
fi
