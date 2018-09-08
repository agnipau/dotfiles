function sclone
  if test $argv[1] = gitlab
    git clone git@gitlab.com:$argv[2].git
  else
    git clone git@github.com:$argv[1].git
  end
end
