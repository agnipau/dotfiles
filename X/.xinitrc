xrdb -load ~/.Xresources
xrandr --output eDP1 --off
xrandr -s 2560x1440
picom &
dunst &
flameshot &
nm-applet &
unclutter &
# sxhkd &
hsetroot -solid '#282c34'
# exec bspwm
exec awesome

