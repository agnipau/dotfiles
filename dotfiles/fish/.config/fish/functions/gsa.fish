function gsa
  cd $HOME/progetti; or exit 1
  for i in *
    echo $i
    cd $i; or exit 1
    git status
    cd ..; or exit 1
  end
end
