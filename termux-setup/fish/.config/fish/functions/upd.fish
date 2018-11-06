function upd
  if test $PREFIX
    pkg update
    pkg upgrade
  else
    sudo pacman -Syu --noconfirm --color=auto
  end
end
