function src
  if test $PREFIX
    pkg search $argv
  else
    pacman --color=auto -Ss $argv
  end
end
