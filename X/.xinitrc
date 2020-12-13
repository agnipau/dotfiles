xrdb -load ~/.Xresources
xrandr --output eDP-1 --off
xrandr -s 2560x1440
picom &
dunst &
flameshot &
# nm-applet &
unclutter &
# ~/progetti/bin/fix-gnome-keybindings
udiskie &
xsetroot -cursor_name left_ptr
# polybar main &
hsetroot black
# blueman-applet &
# wmname LG3D
# exec gnome-session
# exec awesome
exec i3

