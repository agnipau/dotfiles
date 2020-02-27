set fish_greeting ""

set -U fish_user_paths /home/matte/.cargo/bin $fish_user_paths

set -x EDITOR "nvim"

alias uupd "yay --color=always -Syyuv"
alias upd "yay --color=always -Syuv"
alias autorem "yay --color=always -R (yay -Qdtq)"
alias src "yay --color=always -Ss"
alias ins "yay -S --needed --noconfirm"
alias rem "yay -R --noconfirm"
alias ls "exa -lh"
alias la "exa -lah"
alias t "tmux"
alias dl "curl -LO"
alias cpp "rsync -ah --progress"
abbr pfzf "(eval (history | head -n1)) | fzf"

source /usr/share/autojump/autojump.fish

set color_grey = "a89984"

set fish_color_normal            white
set fish_color_command           --bold white
set fish_color_quote             green
set fish_color_redirection       cyan
set fish_color_end               --bold black
set fish_color_error             red
set fish_color_param             white
set fish_color_comment           --bold black
set fish_color_search_match      --background=yellow
set fish_color_operator          --bold yellow
set fish_color_escape            magenta
set fish_color_autosuggestion    $color_grey
set fish_color_cancel            --bold red
set fish_pager_color_completion  --bold white
set fish_pager_color_description $color_grey
set fish_pager_color_prefix      --bold yellow

# Start tmux automatically whenever a new terminal instance is opened.
test -z $TMUX;
  and test $DISPLAY;
  and tmux

