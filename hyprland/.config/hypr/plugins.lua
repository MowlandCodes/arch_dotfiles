package.path = package.path .. ";./?.lua;./?/init.lua"

local smw = require("plugins.split-monitor-workspaces")

smw.setup({
    workspace_count = 1,
    keep_focused = false,
    enable_notifications = false,
    enable_persistent_workspaces = true,
    link_monitors = false,
    monitor_priority = { "eDP-1", "HDMI-A-1" },
    max_workspaces = {
        ["eDP-1"] = 6,
        ["HDMI-A-1"] = 6,
    },
})

return smw
