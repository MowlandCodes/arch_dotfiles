local V = require("variables")

hl.on("hyprland.start", function()
	hl.exec_cmd("systemctl --user start hyprland-session.target")
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
	hl.exec_cmd("blueman-applet") -- Bluetooth
	hl.exec_cmd("whatsie") -- Whatsapp
	hl.exec_cmd("vesktop") -- Discord
	hl.exec_cmd("fdm --hidden") -- Free Download Manager (Background)
	hl.exec_cmd([[hyprctl setcursor "Catppuccin Macchiato Lavender" 24]])
	hl.exec_cmd("clevo-fan-control")
	hl.exec_cmd("Telegram")

	-- For storing secrets / keyring
	-- hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("gnome-keyring-daemon --start --components=secrets")
	hl.exec_cmd(V.stickynotes)
end)
