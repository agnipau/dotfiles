# vim:ft=sh
#
# .xinitrc

setxkbmap it
xset b off
xset s off
xset m 1/1
xset r rate 200 40
xrdb ${HOME}/.Xresources

wal -R -o ${HOME}/bin/wal-set -l

compton -b --config ${HOME}/.config/compton/compton.conf

exec openbox
