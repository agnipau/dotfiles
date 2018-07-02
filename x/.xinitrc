# vim:ft=sh
#
# .xinitrc


# X options
setxkbmap it
xset b off
xset s off
xset r rate 200 40


# Load .Xresources
[[ -f ${HOME}/.Xresources ]] && xrdb ${HOME}/.Xresources


# Load .Xmodmap
[[ -f ${HOME}/.Xmodmap ]] && xmodmap ${HOME}/.Xmodmap


# Restore previous colorscheme
wal -c -R -o ${HOME}/bin/wal-set


# Start compton in the background
compton -b --config ${HOME}/.config/compton/compton.conf


# Exec WM (currently I'm using openbox)
#exec 2bwm
#exec openbox-session
exec bspwm
