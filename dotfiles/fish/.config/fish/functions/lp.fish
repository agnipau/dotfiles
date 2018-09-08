function lp
  if test $PREFIX
    ~/bin/termux-list-pkgs
  else
    ~/bin/arch-list-pkgs
    ~/bin/aur-list-pkgs
  end
end
