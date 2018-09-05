#!/usr/bin/env fish
#
# Some useful bindings.

# Open files in NeoVim quickly with fzf.
function _fzf_nvim
  clear

  set fnfiles (fd --type f --hidden --follow --exclude .git \
              | fzf --multi --inline-info --reverse --height 95%)
  if test "$fnfiles"
    nvim $fnfiles
  end

  commandline -f repaint
end

for mode in (bind -L)
  bind -M $mode \ce _fzf_nvim
end

# Change directory quickly with fzf.
function _fzf_cd
  clear

  set fdirs (fd --type d --hidden --follow --exclude .git \
            | fzf --multi --inline-info --reverse --height 95%)

  if test "$fdirs"
    cd $fdirs[1]
  end

  commandline -f repaint
end

for mode in (bind -L)
  bind -M $mode \ec _fzf_cd
end

# Navigate through history quickly with fzf.
function _fzf_history
  clear

  history --merge
  set hcmd (history \
           | fzf --multi --inline-info --reverse --height 95%)

  commandline -f repaint
  commandline -r "$hcmd"
end

for mode in (bind -L)
  bind -M $mode \cr _fzf_history
end

# General purpose fzf widget (searches for files).
function _fzf_general_files
  clear

  set fgfiles (fd --type f --hidden --follow --exclude .git \
              | fzf --multi --inline-info --reverse --height 95%)
  
  commandline -f repaint end-of-line
  commandline -a "$fgfiles"
end

for mode in (bind -L)
  bind -M $mode \ct _fzf_general_files
end

# General purpose fzf widget (searches for directories).
function _fzf_general_dirs
  clear

  set fgdirs (fd --type d --hidden --follow --exclude .git \
             | fzf --multi --inline-info --reverse --height 95%)
  
  commandline -f repaint end-of-line
  commandline -a "$fgdirs"
end

for mode in (bind -L)
  bind -M $mode \et _fzf_general_dirs
end

# Make accept-autosuggestion work in vi mode.
for mode in (bind -L)
    bind -M $mode \e\  accept-autosuggestion execute
    bind -M $mode \el  accept-autosuggestion
end

# Port of the oh-my-zsh sudo plugin for fish.
function _desc_sudo
    commandline -C 0
    commandline -i 'sudo '
    commandline -f end-of-line
end

for mode in (bind -L)
    bind -M $mode \cs _desc_sudo
end
function fish_user_key_bindings
end

fzf_key_bindings
