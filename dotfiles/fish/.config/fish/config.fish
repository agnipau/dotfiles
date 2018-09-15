# config.fish
#
# fish shell config file.

# vi mode.
#fish_vi_key_bindings
#function fish_mode_prompt; end
#set fish_cursor_default block
#set fish_cursor_insert  block
#set fish_cursor_visual  block

# emacs mode.
fish_default_key_bindings

# Suppress the greeting messagge.
set fish_greeting ""

# Suppress the window title.
#function fish_title; end

# Envars.
if test $PREFIX
  set -x PATH                 $HOME/bin $PATH
  set -x VISUAL               /data/data/com.termux/files/usr/bin/nvim
  set -x EDITOR               /data/data/com.termux/files/usr/bin/nvim
  set -x RTV_BROWSER          /data/data/com.termux/files/usr/bin/w3m
  set -x XDG_CONFIG_HOME      $HOME/.config
  set -x SSH_KEY_PATH         $HOME/.ssh/id_rsa
else
  set -x PATH                 /home/matte/.phantomjs/bin /home/matte/bin /home/matte/.gem/ruby/2.5.0/bin $PATH
  set -x VISUAL               /usr/bin/nvim
  set -x EDITOR               /usr/bin/nvim
  set -x BROWSER              /usr/bin/chromium
  set -x RTV_BROWSER          /usr/bin/w3m
  set -x XDG_CONFIG_HOME      /home/matte/.config
  set -x SSH_KEY_PATH         /home/matte/.ssh/id_rsa
end

set -x LANG                   it_IT.UTF-8
set -x RANGER_LOAD_DEFAULT_RC false
set -x MANPAGER               'nvim -c MANPAGER -'

# fzf options.
set -x FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
set -x FZF_DEFAULT_OPTS "
  --multi --inline-info --reverse --height 95%
  --color fg:8,hl:1,fg+:1,bg+:0,hl+:7
  --color info:0,prompt:1,spinner:1,pointer:1,marker:1
"

# Source material-default colors.
. $HOME/progetti/themes/sh/material-default.fish

# Highlight groups.
set fish_term256   0
set fish_term24bit 1

## Static colors.
set fish_color_comment           --bold black
set fish_color_operator          --bold bryellow
set fish_color_cancel            --bold red
set fish_color_search_match      --background=red
set fish_pager_color_prefix      --bold red
set fish_pager_color_completion  --bold white

# Auto calling functions.
alias ls   'ls --group-directories-first --color=auto'
alias sudo 'sudo -p (tput bold; tput setaf 1; printf ">> "; tput sgr0)'
alias rg   'rg --smart-case'
alias du   'du -h'
alias pqiv 'pqiv -i --box-colors=$color7:$color0_lighter_90 --bind-key="@MONTAGE { h { montage_mode_shift_x(-1) } }" --bind-key="@MONTAGE { j { montage_mode_shift_y(1) } }" --bind-key "@MONTAGE { k { montage_mode_shift_y(-1) } }" --bind-key "@MONTAGE { l { montage_mode_shift_x(1) } }" --bind-key="j { goto_file_relative(-1) }" --bind-key="k { goto_file_relative(1) }" --bind-key="h { goto_file_relative(-1) }" --bind-key="l { goto_file_relative(1) }" --bind-key="d { command(rm $1) }" $argv'

# Start tmux automatically whenever a new terminal instance is opened.
test -z $TMUX;
  and test $DISPLAY;
  and tmux -2
