function clone
  if test $argvs[1] = gitlab
    git clone --depth 1 https://gitlab.com/$argv[2].git
  else
    git clone --depth 1 https://github.com/$argv[1].git
  end
end
