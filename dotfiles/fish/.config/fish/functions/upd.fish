function upd
  if test $PREFIX
    pkg update
    plg upgrade
  else
    sudo pacman -Syu --noconfirm --color auto
  end
end
