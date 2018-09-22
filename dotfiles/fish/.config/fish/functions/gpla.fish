function gpla
  cd $HOME/progetti; or exit 1
  for i in *
    printf '%b\n' "\\e[1;31m:: \\e[1;37m$i\\e[0m"
    cd $i; or exit 1
    git pull
    cd ..; or exit 1
  end
end
