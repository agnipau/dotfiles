function fish_prompt
  set -l last_status "$status"

  # Get the current row number.
  ~/bin/crown
  set -l crown (cat "$HOME/.crown.tmp")

  if test "$crown" -ne 1
    printf '\n'
  end

  set -l grepo (git rev-parse --is-inside-work-tree ^/dev/null)
  set -l spwd (printf "$PWD" | sed "s:^$HOME:~:")

  set_color -oi cyan

  if test "$grepo"
    printf '%s' "$spwd"
    set_color normal
     
    set -l gdirty (git status --porcelain --ignore-submodules ^/dev/null)
    set -l gbranch (git rev-parse --abbrev-ref HEAD ^/dev/null)
     
    set_color -o red

    if test "$gdirty"
      printf ' %s %s' 'on ' "$gbranch"
      set_color -o cyan
      printf ' %s\n' '✘'
    else
      printf ' %s %s\n' 'on ' "$gbranch"
    end
  else
    printf '%s\n' "$spwd"
    set_color normal
  end

  if test "$last_status" -eq 0
    set_color -o white
  else
    set_color -o red
  end
  printf '%s ' '::'
end
