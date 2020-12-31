xrdb -load ~/.Xresources
setxkbmap -model pc105 -layout it -variant us -option caps:ctrl_modifier
dunst &
picom &
flameshot &
unclutter &
udiskie &
xsetroot -cursor_name left_ptr
hsetroot -solid '#000000'
exec i3

