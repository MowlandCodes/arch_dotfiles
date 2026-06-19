local variables = {
	terminal = "kitty",
	fileManager = "thunar --class Thunar --name Thunar",
	menu = "~/.config/rofi/scripts/launcher_t1",

	-- Add this line in ~/.config/brave-flags.conf
	-- --password-store=gnome-libsecret --ozone-platform-hint=auto --gtk-version=4 --disable-gpu-compositing
	browser = "brave",

	logout = [[command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit]],
	screenshot = [[grimblast --freeze save area - | satty --filename - --copy-command=wl-copy --floating-hack --output-filename ~/Pictures/Screenshots/Screenshot-$(date '+%Y%m%d-%H:%M:%S').png]],
	calc = "~/.local/bin/rofi-calc",
	emoji = "~/.local/bin/rofi-emoji",
	powermenu = "~/.config/rofi/scripts/powermenu_t3",
	stickynotes = "mkdir -p ~/Documents/NOTES && kitty --class mowland-stickynotes -e nvim ~/Documents/NOTES",
}

return variables
