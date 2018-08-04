# vim:ft=sh
#
# xinit config file.

# I don't know why, but with nvidia drivers, I need this to get X server
# working. This set dpi to 75, then dpi are set back to 96 (default) in
# openbox autostart file.
xrandr --auto

# Other x options.
setxkbmap it
xset b off
xset s off
xset m 1/1
xset r rate 200 40
xrdb ~/.Xresources
xmodmap ~/.Xmodmap

# The rest can be found in ~/.config/openbox/autostart
exec openbox-session
