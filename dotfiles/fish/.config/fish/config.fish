# config.fish
#
# fish shell config file.

# vi mode please.
fish_vi_key_bindings
function fish_mode_prompt; end
set fish_cursor_default block
set fish_cursor_insert  block
set fish_cursor_visual  block

# Suppress the greeting messagge.
set fish_greeting ""

# Suppress the window title.
function fish_title; end

# Envars.
set -x PATH                   $HOME/bin $HOME/.gem/ruby/2.5.0/bin $PATH
set -x VISUAL                 "/usr/bin/nvim"
set -x EDITOR                 "/usr/bin/nvim"
set -x BROWSER                "/usr/bin/chromium"
set -x RTV_BROWSER            "/usr/bin/w3m"
set -x LANG                   "it_IT.UTF-8"
set -x XDG_CONFIG_HOME        "$HOME/.config"
set -x SSH_KEY_PATH           "$HOME/.ssh/id_rsa"
set -x RANGER_LOAD_DEFAULT_RC "false"
set -x MANPAGER               "nvim -c MANPAGER -"

# fzf options.
set -x FZF_DEFAULT_COMMAND "fd --type f --hidden --follow --exclude .git"
set -x FZF_DEFAULT_OPTS    "--multi --inline-info --reverse --height 95%"

# Use escape sequences to change the value of color17.
# I primarily need this trick for my wal.vim fork.
if test -f "$HOME/.cache/wal/colors.fish"
  if test (cat "$HOME/.cache/wal/mode") = "dark"
    . "$HOME/.cache/wal/colors.fish"
    set cl1 (printf "$color0_lighter_150" | cut -c2-3)
    set cl2 (printf "$color0_lighter_150" | cut -c4-5)
    set cl3 (printf "$color0_lighter_150" | cut -c6-7)
    printf "\e]4;17;rgb:$cl1/$cl2/$cl3\e\\"
  else if test (cat "$HOME/.cache/wal/mode") = "light"
    . "$HOME/.cache/wal/colors.fish"
    set cd1 (printf "$color0_darker_20"   | cut -c2-3)
    set cd2 (printf "$color0_darker_20"   | cut -c4-5)
    set cd3 (printf "$color0_darker_20"   | cut -c6-7)
    printf "\e]4;17;rgb:$cd1/$cd2/$cd3\e\\"
  end
end

# Highlight groups.
## Static colors.
set fish_color_comment           --bold black
set fish_color_operator          --bold bryellow
set fish_color_cancel            --bold red
set fish_color_search_match      --background=red
set fish_pager_color_prefix      --bold red
set fish_pager_color_completion  --bold white

## Variable colors.
set fish_color_autosuggestion    ffffff
set fish_pager_color_progress    121312
set fish_pager_color_description ffffff

# Source fzf.
test -f "$HOME/.fzf.fish";
  and . "$HOME/.fzf.fish"

# Start tmux automatically whenever a new terminal instance is opened.
test -z "$TMUX";
  and test "$DISPLAY";
  and tmux -2
