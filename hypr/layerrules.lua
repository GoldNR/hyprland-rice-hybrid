hl.layer_rule({
    match = {namespace = "gtk-layer-shell"},
    blur = true,
    ignore_alpha = 0.01,
    order = 0,
})

hl.layer_rule({
    match = {namespace = "noctalia-dock"},
    order = -100,
})

hl.layer_rule({
    match = {namespace = "notifications"},
    blur = true,
    ignore_alpha = 0.01,
})

hl.layer_rule({
    match = {namespace = "logout_dialog"},
    blur = true,
    ignore_alpha = 0.01,
})

hl.layer_rule({
  name = "noctalia",
  match = {
    namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$",
  },
  no_anim = true,
  ignore_alpha = 0.5,
  blur = true,
  blur_popups = true,
})
