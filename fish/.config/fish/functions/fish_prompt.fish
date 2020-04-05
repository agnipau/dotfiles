#!/usr/bin/env fish

function fish_prompt
    env EXIT_CODE=$status CLICOLOR_FORCE=1 sprompt

    # set -l last_status $status

    # set_color -oi blue
    # printf '%s ' (printf $PWD | sed "s:^$HOME:~:")
    # set_color normal

    # set -l grepo (git rev-parse --is-inside-work-tree ^/dev/null)

    # if test "$grepo"
    #   set -l gbranch (git rev-parse --abbrev-ref HEAD ^/dev/null)
    #   set -l gdirty (git status --porcelain --ignore-submodules ^/dev/null)

    #   set_color -o green
    #   printf '%s %s ' 'on ' "$gbranch"
    #   # echo -n "on  $gbranch "

    #   if test "$gdirty"
    #     set_color -o cyan
    #     printf '%s ' '✘'
    #   end
    # end

    # if test $last_status -eq 0
    #   set_color -o white
    # else
    #   set_color -o red
    # end
    # printf '%s ' '::'

    # set_color normal
end

