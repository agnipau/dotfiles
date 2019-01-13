function uupd
  if test -z $PREFIX
    upd
    aupd
    autorem
  else
    upd
    autorem
  end
end
