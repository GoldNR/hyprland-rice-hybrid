-- This file contains general customization options 
-- For Environment variables see env.conf
-- For Keybinds variables see keybinds.conf 
-- For Auto-run stuff see execs.conf

require("env")

--############################ Monitor ############################
hl.monitor({
    output = "",
    mode = "1920x1080@100",
    position = "auto",
    scale = "1",
})

hl.monitor({
    output = "",
    reserved_area = { top = 61, bottom = 0, left = 0, right = 0 },
})

--monitor=HDMI-A-1,1920x1080@60,1920x0,1,mirror,eDP-1  # screen mirror for laptop -> hdmi

--################### Core components (authentication, idle daemon and stuff) ##############
require("execs")

require("keybinds")

--############################# Input ##############################
hl.gesture({
    fingers = 4,
    direction = "horizontal",
    action = "workspace",
})

require("animations")

require("windowrules")

require("layerrules")

require("colors")

local osettings = require("hyprsettings-persist")

hl.config({
    input = {
        -- ########## Mouse
        -- accel_profile = adaptive,
        force_no_accel = false,
        --sensitivity = 0,
        
        -- ########## Keyboard
        kb_layout = "us",
        follow_mouse = 1,
        numlock_by_default = false,
        touchpad = {
            natural_scroll = true,
            disable_while_typing = true,
            clickfinger_behavior = true,
            scroll_factor = 0.7,
        },
        scroll_method = "2fg",
    },
    
    general = {
        gaps_in = osettings.gaps_in,
        gaps_out = osettings.gaps_out,
        border_size = osettings.border_size,
        -- ######### Fallback colors
        col = {
            
            active_border = {
                colors = { "rgba(0DB7D4FF)", "rgba(7AA2F7FF)", "rgba(9778D0FF)" },
                angle = 45
            },
            inactive_border = "rgba(04404aaa)",
        },
        -- ######### Functionality
        -- resize_on_border = true
        layout = "dwindle",
    },
    
    dwindle = {
        preserve_split = true, -- you probably want this
        --no_gaps_when_only = true,
    },
    
    decoration = {
        rounding = osettings.rounding,
        blur = {
            size = osettings.blur_size,
            passes = osettings.blur_passes,
            ignore_opacity = false,
        },
        -- Shadow
        shadow = {
            enabled = false,
            range = 30,
            render_power = 3,
            color = "rgba(01010166)",
        },
        -- Shader
        -- screen_shader = ~/.config/hypr/shaders/nothing.frag
        -- Dim
        dim_inactive = false,
        dim_strength = 0.1,
        dim_special = 0,
        --screen_shader = ~/.config/hypr/shaders/drugs.frag
        --screen_shader = ~/.config/hypr/shaders/crt.frag
    },
    
    animations = {
        enabled = true,
    },
    
    misc = {
        vrr = 1,
        focus_on_activate = true,
        animate_manual_resizes = true,
        animate_mouse_windowdragging = true,
        enable_swallow = true,
    },
    
    debug = {
        vfr = 1,
        --overlay = true,
        --damage_tracking = 0,
    },
})
