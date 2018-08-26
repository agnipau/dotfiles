function fish_prompt
  set -l last_status $status
  set -l branch (git rev-parse --abbrev-ref HEAD ^ /dev/null)

  if not set -q PREFIX
    set_color -o yellow
    printf '%s' (whoami)
    set_color normal
   
    set_color -oi green
    printf ' %s' (pwd | sed "s:$HOME:~:")
    set_color normal
   
    set_color -o yellow
    if [ $branch ]
      printf '%s' " on  $branch"
    end
    set_color normal
   
    if [ $last_status -eq 0 ]
      set_color -o white
      printf '%s' " :: "
      set_color normal
    else
      set_color -o red
      printf '%s' " :: "
      set_color normal
    end
   
    if [ -z $TMUX ]
      echo -ne "\033]0; \007"
    end
  else if set -q PREFIX
    set_color -o yellow
    printf '%s' (whoami)
    set_color normal
   
    set_color -oi green
    printf ' %s' (basename (pwd | sed "s:$HOME:~:"))
    set_color normal
   
    set_color -o yellow
    if [ $branch ]
      printf '%s' " on  $branch"
    end
    set_color normal
   
    if [ $last_status -eq 0 ]
      set_color -o white
      printf '%s' " :: "
      set_color normal
    else
      set_color -o red
      printf '%s' " :: "
      set_color normal
    end
   
    if [ -z $TMUX ]
      echo -ne "\033]0; \007"
    end
  end
end
