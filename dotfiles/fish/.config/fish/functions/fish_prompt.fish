#!/usr/bin/env fish
#
# My fish prompt.

function fish_prompt
  set -l last_status $status

  set_color -oi cyan  # onii-chan
  printf '%s ' (printf $PWD | sed "s:^$HOME:~:")
  set_color normal

  set -l grepo (git rev-parse --is-inside-work-tree ^/dev/null)

  if test "$grepo"
    set -l gbranch (git rev-parse --abbrev-ref HEAD ^/dev/null)
    set -l gdirty (git status --porcelain --ignore-submodules ^/dev/null)

    set_color -o red
    printf '%s %s ' 'on ' "$gbranch"

    if test "$gdirty"
      set_color -o cyan
      printf '%s ' '✘'
    end
  end

  if test $last_status -eq 0
    set_color -o white
  else
    set_color -o red
  end
  printf '%s ' '::'

  set_color normal
end
