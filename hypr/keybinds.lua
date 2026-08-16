local mainMod = "SUPER"

-- Converted from the old data-table format (which never called hl.bind(),
-- so none of these fired) into real hl.bind() calls in the 0.55 Lua API.
--
-- Lines marked VERIFY use a dispatcher/option name I could not confirm
-- directly in the Hyprland docs I had access to. They're my best mapping
-- from the documented pattern, but test them with `hyprctl repl` if they
-- error or don't behave as expected:
--   » hyprctl repl 'hl.dispatch(hl.dsp.window.bring_to_top())'

------------------------
---- LANGUAGE ----
------------------------
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd("ibus engine Bamboo::Us"))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd("ibus engine xkb:us::eng"))
hl.bind(mainMod .. " + Space",     hl.dsp.exec_cmd("~/.config/eww/scripts/language --cycle"))

---------------------------------
---- IT JUST WORKS(tm) BINDS ----
---------------------------------
-- Volume
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"),          { locked = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),           { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),           { locked = true, repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("~/.config/eww/scripts/volume osd &"),                  { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("~/.config/eww/scripts/volume osd &"),                  { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("~/.config/eww/scripts/volume osd &"),                  { locked = true })

-- Brightness
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("light -A 3 && ~/.config/eww/scripts/brightness osd &"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("light -U 3 && ~/.config/eww/scripts/brightness osd &"), { locked = true, repeating = true })

--------------------------------
---- APPS: normal apps ----
--------------------------------
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("code --password-store=gnome --enable-features=UseOzonePlatform --ozone-platform=wayland"))
hl.bind("CONTROL + SHIFT + ALT + Y", hl.dsp.exec_cmd("yuzu"))
hl.bind(mainMod .. " + T",        hl.dsp.exec_cmd("foot --override shell=fish"))
hl.bind(mainMod .. " + ALT + T",  hl.dsp.exec_cmd("wezterm"))
hl.bind(mainMod .. " + Return",   hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + E",        hl.dsp.exec_cmd("nautilus --new-window"))
hl.bind(mainMod .. " + W",        hl.dsp.exec_cmd("firefox"))
hl.bind(mainMod .. " + CONTROL + ALT + E", hl.dsp.exec_cmd("/usr/bin/microsoft-edge-stable --password-store=gnome --enable-features=UseOzonePlatform --ozone-platform=wayland --gtk-version=4"))
hl.bind(mainMod .. " + X",        hl.dsp.exec_cmd("gnome-text-editor --new-window"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("wps"))

------------------------------------
---- APPS: settings and config ----
------------------------------------
hl.bind(mainMod .. " + I",        hl.dsp.exec_cmd("gnome-control-center"))
hl.bind(mainMod .. " + CONTROL + V", hl.dsp.exec_cmd("pavucontrol"))
hl.bind("CONTROL + SHIFT + Escape",     hl.dsp.exec_cmd("gnome-system-monitor"))
hl.bind("CONTROL + ALT + SHIFT + Escape", hl.dsp.exec_cmd("foot -T 'btop' btop"))
hl.bind(mainMod .. " + SHIFT + I", hl.dsp.exec_cmd("~/.local/bin/guifetch"))

------------------
---- ACTIONS ----
------------------
hl.bind(mainMod .. " + SHIFT + Period", hl.dsp.exec_cmd("pkill wofi || wofi-emoji"))
hl.bind(mainMod .. " + Period",         hl.dsp.exec_cmd("pkill fuzzel || ~/.local/bin/fuzzel-emoji"))
hl.bind(mainMod .. " + Q",              hl.dsp.window.close())
hl.bind(mainMod .. " + ALT + Space",    hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + ALT + Q", hl.dsp.exec_cmd("hyprctl kill"))
hl.bind("CONTROL + ALT + Delete",       hl.dsp.exec_cmd("pkill wlogout || wlogout -p layer-shell"))
hl.bind(mainMod .. " + CONTROL + SHIFT + ALT + Delete", hl.dsp.exec_cmd("systemctl poweroff"))

-------------------------------------------------------------------
---- SCREENSHOT, RECORD, OCR, COLOR PICKER, CLIPBOARD HISTORY ----
-------------------------------------------------------------------
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.exec_cmd("~/.local/bin/rubyshot | wl-copy"))
hl.bind(mainMod .. " + SHIFT + ALT + S", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | swappy -f -"))
hl.bind("Print", hl.dsp.exec_cmd("grim - | wl-copy"), { locked = true })
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | wl-copy"))
hl.bind(mainMod .. " + ALT + R",   hl.dsp.exec_cmd("~/.local/bin/record-script.sh"))
hl.bind("CONTROL + ALT + R",       hl.dsp.exec_cmd("~/.local/bin/record-script.sh --sound"))
hl.bind(mainMod .. " + SHIFT + ALT + R", hl.dsp.exec_cmd("~/.local/bin/record-script-fullscreen.sh"))
hl.bind(mainMod .. " + CONTROL + SHIFT + S", hl.dsp.exec_cmd("grim -g \"$(slurp)\" \"tmp.png\" && tesseract \"tmp.png\" - | wl-copy && rm \"tmp.png\""))
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd("grim -g \"$(slurp)\" \"tmp.png\" && tesseract \"tmp.png\" - | wl-copy && rm \"tmp.png\""))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind(mainMod .. " + B",         hl.dsp.exec_cmd("copyq menu"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("pkill fuzzel || cliphist list | fuzzel --no-fuzzy --icon-theme=candy-icons --background-color=1D1D27ee --text-color=cdd6f4ff --match-color=AC16C7FF --border-width=3 --border-radius=10 --border-color=8701E7FF\t --selection-color=585b70ff --selection-text-color=cdd6f4ff --selection-match-color=AC16C7FF --font=\"Rubik\"  --prompt=\"   \" --dmenu | cliphist decode | wl-copy"))

------------------
---- MEDIA ----
------------------
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("playerctl next || playerctl position `bc <<< \"100 * $(playerctl metadata mpris:length) / 1000000 / 100\"`"))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("playerctl previous"))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("playerctl play-pause"))

--------------------------------------------------
---- LOCK SCREEN  |  blur: --effect-blur=20x20 ----
--------------------------------------------------
hl.bind(mainMod .. " + L",         hl.dsp.exec_cmd("~/.local/bin/lock.sh"))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("~/.local/bin/lock.sh"))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("sleep 0.1 && systemctl suspend"), { locked = true })

------------------------
---- APP LAUNCHER ----
------------------------
-- VERIFY: "release" is my best guess for the bindr ("trigger on key release") flag name
hl.bind(mainMod .. " + SUPER_L", hl.dsp.exec_cmd("~/.config/eww/scripts/toggle-overview.sh --keypress &"), { release = true })
hl.bind(mainMod .. " + Slash", hl.dsp.exec_cmd("pkill fuzzel || fuzzel --icon-theme=candy-icons --background-color=1D1D27ee --text-color=cdd6f4ff --match-color=AC16C7FF --border-width=3 --border-radius=10 --border-color=8701E7FF\t --selection-color=585b70ff --selection-text-color=cdd6f4ff --selection-match-color=AC16C7FF --font=\"Rubik\"  --prompt=\"    \""))

------------------------
---- EWW KEYBINDS ----
------------------------
-- VERIFY: "release" flag name, see note above
hl.bind(mainMod .. " + CONTROL + R", hl.dsp.exec_cmd("pkill eww && eww daemon && eww open bar && eww open bottomline"), { release = true })
hl.bind(mainMod .. " + Tab", hl.dsp.exec_cmd("~/.config/eww/scripts/toggle-overview.sh &"))
hl.bind(mainMod .. " + O",   hl.dsp.exec_cmd("~/.config/eww/scripts/toggle-osettings.sh --keypress &"))
hl.bind(mainMod .. " + CONTROL + O", hl.dsp.exec_cmd("~/.config/eww/scripts/toggle-osettings.sh --keypress &"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("~/.config/eww/scripts/toggle-bottombar.sh &"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("~/.config/eww/scripts/toggle-onotify.sh --keypress &"))
hl.bind(mainMod .. " + Comma", hl.dsp.exec_cmd("~/.config/eww/scripts/toggle-themer.sh &"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("~/.config/eww/scripts/toggle-dash.sh --keypress &"))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("~/.config/eww/scripts/toggle-dashfs.sh --keypress &"))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("~/.config/eww/scripts/toggle-wingamebar.sh &"))

hl.bind(mainMod .. " + CONTROL + Tab", hl.dsp.exec_cmd("~/.config/eww/scripts/toggle-compactmode.sh"))
hl.bind(mainMod .. " + ALT + W",       hl.dsp.exec_cmd("~/.config/eww/scripts/toggle-winmode.sh"))

--------------------------------------
---- KEYBINDS FOR HYPRLAND ----
--------------------------------------
-- Swap windows
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "d" }))

-- Move focus
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "d" }))
hl.bind(mainMod .. " + BracketLeft",  hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + BracketRight", hl.dsp.focus({ direction = "r" }))

-- Window title (fires alongside the focus binds above on the same combo)
hl.bind(mainMod .. " + left",  hl.dsp.exec_cmd("eww update rev_center_ws=false"))
hl.bind(mainMod .. " + right", hl.dsp.exec_cmd("eww update rev_center_ws=false"))
hl.bind(mainMod .. " + up",    hl.dsp.exec_cmd("eww update rev_center_ws=false"))
hl.bind(mainMod .. " + down",  hl.dsp.exec_cmd("eww update rev_center_ws=false"))
hl.bind(mainMod .. " + BracketLeft",  hl.dsp.exec_cmd("eww update rev_center_ws=false"))
hl.bind(mainMod .. " + BracketRight", hl.dsp.exec_cmd("eww update rev_center_ws=false"))
hl.bind("ALT + Tab", hl.dsp.exec_cmd("eww update rev_center_ws=false"))

-- Workspace, window, tab switch with keyboard
hl.bind(mainMod .. " + CONTROL + right",       hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainMod .. " + CONTROL + left",        hl.dsp.focus({ workspace = "-1" }))
hl.bind(mainMod .. " + CONTROL + BracketLeft", hl.dsp.focus({ workspace = "-1" }))
hl.bind(mainMod .. " + CONTROL + BracketRight",hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainMod .. " + CONTROL + up",          hl.dsp.focus({ workspace = "-5" }))
hl.bind(mainMod .. " + CONTROL + down",        hl.dsp.focus({ workspace = "+5" }))
hl.bind(mainMod .. " + Page_Down",             hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainMod .. " + Page_Up",               hl.dsp.focus({ workspace = "-1" }))
hl.bind(mainMod .. " + CONTROL + Page_Down",   hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainMod .. " + CONTROL + Page_Up",     hl.dsp.focus({ workspace = "-1" }))
hl.bind(mainMod .. " + SHIFT + Page_Down",     hl.dsp.window.move({ workspace = "+1" }))
hl.bind(mainMod .. " + SHIFT + Page_Up",       hl.dsp.window.move({ workspace = "-1" }))
hl.bind(mainMod .. " + CONTROL + SHIFT + Right", hl.dsp.window.move({ workspace = "+1" }))
hl.bind(mainMod .. " + CONTROL + SHIFT + Left",  hl.dsp.window.move({ workspace = "-1" }))
hl.bind(mainMod .. " + SHIFT + mouse_down",    hl.dsp.window.move({ workspace = "+1" }))
hl.bind(mainMod .. " + SHIFT + mouse_up",      hl.dsp.window.move({ workspace = "-1" }))

-- Show workspaces module (fires alongside the workspace binds above on the same combos)
hl.bind(mainMod .. " + CONTROL + right",       hl.dsp.exec_cmd("eww update rev_center_ws=true"))
hl.bind(mainMod .. " + CONTROL + left",        hl.dsp.exec_cmd("eww update rev_center_ws=true"))
hl.bind(mainMod .. " + CONTROL + BracketLeft", hl.dsp.exec_cmd("eww update rev_center_ws=true"))
hl.bind(mainMod .. " + CONTROL + BracketRight",hl.dsp.exec_cmd("eww update rev_center_ws=true"))
hl.bind(mainMod .. " + CONTROL + up",          hl.dsp.exec_cmd("eww update rev_center_ws=true"))
hl.bind(mainMod .. " + CONTROL + down",        hl.dsp.exec_cmd("eww update rev_center_ws=true"))
hl.bind(mainMod .. " + Page_Down",             hl.dsp.exec_cmd("eww update rev_center_ws=true"))
hl.bind(mainMod .. " + Page_Up",               hl.dsp.exec_cmd("eww update rev_center_ws=true"))
hl.bind(mainMod .. " + CONTROL + Page_Down",   hl.dsp.exec_cmd("eww update rev_center_ws=true"))
hl.bind(mainMod .. " + CONTROL + Page_Up",     hl.dsp.exec_cmd("eww update rev_center_ws=true"))
hl.bind(mainMod .. " + SHIFT + Page_Down",     hl.dsp.exec_cmd("eww update rev_center_ws=true"))
hl.bind(mainMod .. " + SHIFT + Page_Up",       hl.dsp.exec_cmd("eww update rev_center_ws=true"))
hl.bind(mainMod .. " + CONTROL + SHIFT + Right", hl.dsp.exec_cmd("eww update rev_center_ws=true"))
hl.bind(mainMod .. " + CONTROL + SHIFT + Left",  hl.dsp.exec_cmd("eww update rev_center_ws=true"))
hl.bind(mainMod .. " + SHIFT + mouse_down",    hl.dsp.exec_cmd("eww update rev_center_ws=true"))
hl.bind(mainMod .. " + SHIFT + mouse_up",      hl.dsp.exec_cmd("eww update rev_center_ws=true"))

-- Window split ratio
-- VERIFY: hl.dsp.layout(str) is confirmed for "togglesplit"; passing a full
-- "splitratio N" string through the same wrapper is inferred, not confirmed.
hl.bind(mainMod .. " + Minus",      hl.dsp.layout("splitratio -0.1"), { repeating = true })
hl.bind(mainMod .. " + Equal",      hl.dsp.layout("splitratio 0.1"),  { repeating = true })
hl.bind(mainMod .. " + Semicolon",  hl.dsp.layout("splitratio -0.1"), { repeating = true })
hl.bind(mainMod .. " + Apostrophe", hl.dsp.layout("splitratio 0.1"),  { repeating = true })

-- Fullscreen
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())

-- Switching workspaces
hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special())
hl.bind(mainMod .. " + CONTROL + S", hl.dsp.workspace.toggle_special())
hl.bind("ALT + Tab", hl.dsp.window.cycle_next())
-- VERIFY: bring_to_top() name inferred from the window.* naming convention, not confirmed in docs
hl.bind("ALT + Tab", hl.dsp.window.bring_to_top())

-- Move window to workspace, SUPER + ALT + [0-9]
-- VERIFY: "silent" flag inferred to replace the old movetoworkspacesilent dispatcher;
-- if it errors, check the Dispatchers wiki page for the correct field name.
hl.bind(mainMod .. " + ALT + 1", hl.dsp.window.move({ workspace = 1, silent = true }))
hl.bind(mainMod .. " + ALT + 2", hl.dsp.window.move({ workspace = 2, silent = true }))
hl.bind(mainMod .. " + ALT + 3", hl.dsp.window.move({ workspace = 3, silent = true }))
hl.bind(mainMod .. " + ALT + 4", hl.dsp.window.move({ workspace = 4, silent = true }))
hl.bind(mainMod .. " + ALT + 5", hl.dsp.window.move({ workspace = 5, silent = true }))
hl.bind(mainMod .. " + ALT + 6", hl.dsp.window.move({ workspace = 6, silent = true }))
hl.bind(mainMod .. " + ALT + 7", hl.dsp.window.move({ workspace = 7, silent = true }))
hl.bind(mainMod .. " + ALT + 8", hl.dsp.window.move({ workspace = 8, silent = true }))
hl.bind(mainMod .. " + ALT + 9", hl.dsp.window.move({ workspace = 9, silent = true }))
hl.bind(mainMod .. " + ALT + 0", hl.dsp.window.move({ workspace = 10, silent = true }))
hl.bind(mainMod .. " + CONTROL + SHIFT + Up", hl.dsp.window.move({ workspace = "special", silent = true }))
hl.bind(mainMod .. " + ALT + S", hl.dsp.window.move({ workspace = "special", silent = true }))

-- Scroll through existing workspaces with SUPER + scroll
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "-1" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "+1" }))

-- Move/resize windows with SUPER + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())
hl.bind(mainMod .. " + mouse:274", hl.dsp.window.fullscreen({ mode = 1 }))
hl.bind(mainMod .. " + Z",         hl.dsp.window.drag())
-- VERIFY: resize({ mode = "exact", ... }) inferred; check Dispatchers wiki for the confirmed field names
hl.bind(mainMod .. " + CONTROL + Backslash", hl.dsp.window.resize({ mode = "exact", x = 640, y = 480 }))
hl.bind("ALT + RETURN", hl.dsp.window.fullscreen({ mode = 0 }))
