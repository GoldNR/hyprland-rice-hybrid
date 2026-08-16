hl.window_rule({
    match = {
        class = "^(twintaillauncher|net.lutris.Lutris)$",
    },
    size = { 1280, 720 },
    center = true,
    float = true,
    persistent_size = true,
})

hl.window_rule({
    match = {
        class = "^(io.bassi.Amberol)$",
    },
    size = { 660, 660 },
    center = true,
    float = true,
    persistent_size = true,
})

hl.window_rule({
    match = {
        class = "^(guifetch|steam)$",
    },
    float = true,
})

hl.window_rule({ match = { class = "^(steam)$", title = "^(Friends List)$" }, float = true })

local modalMatches = {
    { title = "^(Open|Authentication Required|Add Folder to Workspace|Choose Files|Save As|Confirm to replace files|File Operation Progress)$" },
    { initial_title = "^(Open File)$" },
    { class = "^([Xx]dg-desktop-portal-gtk)$" },
    { title = "^(File Upload|Choose wallpaper|Library)(.*)$" },
    { class = "^(.*dialog.*)$" },
    { title = "^(.*dialog.*)$" },
    { class = "^(hyprland-share-picker)$"},
}
for _, m in ipairs(modalMatches) do hl.window_rule({ match = m, float = true }) end

hl.window_rule({
    match = {
        class = "^(org\\.kde\\.dolphin)$",
        title = "negative:^(Moving.*|Create New.*|Extract.*|Compress.*|Copying.*|Progress.*|Configure.*|Properties.*|Choose\\sApplication.*)$",
    },
    float = true,
    size = { "max(monitor_w, monitor_h)*0.50", "min(monitor_w, monitor_h)*0.55" },
    move = {
        "max(20, min(cursor_x - (window_w*0.50), monitor_w - window_w + 20))", -- X axis clamping
        "max(20, min(cursor_y - 50, monitor_h - window_h + 20))" -- Y axis clamping
    },
})

hl.on("window.active", function(w, active)
    if active == 1 then
        hl.dispatch(hl.dsp.window.bring_to_top({ window = w }))
    end
end)

-- Fix some dragging issues with XWayland
hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})
