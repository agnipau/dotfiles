function ins
  if test $PREFIX
    pkg install $argv
  else
    sudo pacman -S --needed --noconfirm --color=auto $argv
  end
end
