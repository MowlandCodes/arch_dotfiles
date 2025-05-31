dbus-launch &
pulseaudio --start
# Uncomment if you have picom installed and want a transparent background
# picom &
export PATH=$PATH:$HOME/.local/bin/statusbar && dwmblocks 2>/tmp/dwmblocks.log &
