function rem
  if test $PREFIX
    pkg remove $argv
  else
    sudo pacman -Rsu --noconfirm --color=auto $argv
  end
end
