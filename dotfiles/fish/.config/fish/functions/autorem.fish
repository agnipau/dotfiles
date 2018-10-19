function autorem
  if test $PREFIX
    apt autoremove
  else
    sudo pacman -Rsu (pacman -Qdtq) --color=auto
  end
end
