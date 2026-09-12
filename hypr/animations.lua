hl.curve("md3_standard", { type = "bezier", points = { { 0.2, 0.0 }, { 0, 1.0 } } })
hl.curve("md3_decel", { type = "bezier", points = { { 0.05, 0.7 }, { 0.1, 1 } } })
hl.curve("md3_accel", { type = "bezier", points = { { 0.3, 0 }, { 0.8, 0.15 } } })
hl.curve("overshot", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.curve("hyprnostretch", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.0 } } })
hl.curve("win10", { type = "bezier", points = { { 0, 0 }, { 0, 1 } } })
hl.curve("gnome", { type = "bezier", points = { { 0, 0.85 }, { 0.3, 1 } } })
hl.curve("funky", { type = "bezier", points = { { 0.46, 0.35 }, { -0.2, 1.2 } } })
hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 3,
    bezier = "md3_decel",
    style = "popin 0%",
})
hl.animation({
    leaf = "border",
    enabled = true,
    speed = 10,
    bezier = "default",
})
hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 0.0000001,
    bezier = "default",
})
hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 4,
    bezier = "md3_decel",
    style = "slide",
})
