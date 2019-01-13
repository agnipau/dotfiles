function rem
  if test $PREFIX
    pkg remove $argv
  else
    sudo pacman -Rnsu --noconfirm --color=auto $argv
  end
end
