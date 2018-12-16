# vim:ft=sh
#
# xinit config file.

# Other x options.
setxkbmap it
xset b off
xset s off
xset m 1/1
xset r rate 200 40
xrdb ~/.Xresources
xmodmap ~/.Xmodmap

exec startkde
