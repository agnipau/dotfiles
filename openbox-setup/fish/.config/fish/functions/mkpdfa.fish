function mkpdfa
  for i in *
    cd $i
    mkpdf
    cd ..
  end
end
