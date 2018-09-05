function sudo
  sudo -p (tput bold; tput setaf 1; printf ">> "; tput sgr0) $argv
end
