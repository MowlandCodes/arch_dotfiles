hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

hl.window_rule({
    name = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move = "20 monitor_h-120",
    float = true,
})

hl.window_rule({
    name = "xwayland-video-bridge-fixes",
    match = { class = "xwaylandvideobridge" },
    no_initial_focus = true,
    no_focus = true,
    no_anim = true,
    no_blur = true,
    max_size = "1 1",
    opacity = 0.0,
})

hl.window_rule({
    name = "float-fdm",
    match = { class = "fdm" },
    float = true,
})

hl.window_rule({
    name = "float-whatsapp",
    match = { class = "com.ktechpit.whatsie" },
    float = true,
    persistent_size = true,
})

hl.window_rule({
    name = "float-discord",
    match = { class = "vesktop" },
    float = true,
    persistent_size = true,
})

hl.window_rule({
    name = "browser-extension",
    match = {
        class = "librewolf",
        title = "^Extension",
    },
    float = true,
    persistent_size = true,
})

hl.window_rule({
    name = "volume-control-float",
    match = { class = "org.pulseaudio.pavucontrol" },
    float = true,
    persistent_size = true,
})

hl.window_rule({
    name = "youtube-music-float",
    match = { class = "com.github.th-ch.youtube-music" },
    float = true,
    persistent_size = true,
    size = "monitor_w/1.5 monitor_h/1.5",
})

hl.window_rule({
    name = "float-blueman",
    match = { class = "blueman-manager" },
    float = true,
    persistent_size = true,
})

hl.window_rule({
    name = "float-btop",
    match = {
        class = "floating_btop",
        initial_class = "floating_btop",
    },
    float = true,
    persistent_size = true,
    size = "monitor_w/1.5 monitor_h/1.15",
})

hl.window_rule({
    name = "float-nmtui",
    match = {
        class = "floating_nmtui",
        initial_class = "floating_nmtui",
    },
    float = true,
    persistent_size = true,
    size = "monitor_w/1.5 monitor_h/1.5",
})

hl.window_rule({
    name = "float-thunar",
    match = {
        class = "Thunar",
        initial_class = "Thunar",
    },
    float = true,
    persistent_size = true,
})

hl.window_rule({
    name = "sticky-notes",
    match = { class = "mowland-stickynotes" },
    float = true,
    pin = true,
    size = "750 400",
    move = "monitor_w-800 monitor_h-450",
})

hl.window_rule({
    name = "float-telegram",
    match = { class = "org.telegram.desktop" },
    float = true,
    persistent_size = true,
})
