dbus-launch &
dunst &
pulseaudio --start
# Uncomment if you have picom installed and want a transparent background
picom &
xgifwallpaper -s FILL ~/wallpaper.gif &
xrandr --output eDP-1 --mode 1920x1080 --primary # Set Laptop screen as primary display
xrandr --output HDMI-1 --mode 1920x1080 --rate 74.97 --left-of eDP-1 # Set external display
exec dwm
