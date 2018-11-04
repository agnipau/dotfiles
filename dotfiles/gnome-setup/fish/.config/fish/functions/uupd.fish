function uupd
  if test -z $PREFIX
    upd
    aupd
    autorem
    unvim
  else
    upd
    autorem
    unvim
  end
end
