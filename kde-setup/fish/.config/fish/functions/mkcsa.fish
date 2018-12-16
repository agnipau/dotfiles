function mkcsa
  for i in *; cd $i; mkcs Program.cs; cd ..; end
end
