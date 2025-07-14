dbus-launch &
dunst &
parcellite &
pulseaudio --start
blueman-applet &
# Uncomment if you have picom installed and want a transparent background
#picom &

# Wallpaper
#xgifwallpaper -s FILL ~/wallpaper.gif & # Uncomment this if you want Animated Background
feh --bg-scale ~/wallpaper_static.jpg # Uncomment this if you want a static Background

xrandr --output eDP-1 --mode 1920x1080 --primary # Set Laptop screen as primary display
xrandr --output HDMI-1 --mode 1920x1080 --rate 74.97 --left-of eDP-1 # Set external display
xset s off -dpms # Prevent screen from sleeping
fdm --hidden & # Start FreeDownloadManager in the Background
exec dwm
