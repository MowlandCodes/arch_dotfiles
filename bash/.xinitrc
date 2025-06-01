dbus-launch &
dunst &
pulseaudio --start
# Uncomment if you have picom installed and want a transparent background
picom &
xgifwallpaper -s FILL ~/wallpaper.gif &
exec dwm
