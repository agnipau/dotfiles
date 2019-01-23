# vim:ft=sh
#
# xinit config file.

# Other x options.
setxkbmap it
xset b off
xset s off
xset m 1/1
xrdb ~/.Xresources
xmodmap ~/.Xmodmap

xrandr --setprovideroutputsource modesetting NVIDIA -0
xrandr --auto

#exec startkde
exec openbox-session
