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

bind \ck _fzf_nvim

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

bind \ec _fzf_cd

# Navigate through history quickly with fzf.
function _fzf_history
  clear

  history --merge
  set hcmd (history \
           | fzf --multi --inline-info --reverse --height 95%)

  commandline -f repaint
  commandline -r "$hcmd"
end

bind \cr _fzf_history

# General purpose fzf widget (searches for files).
function _fzf_general_files
  clear

  set fgfiles (fd --type f --hidden --follow --exclude .git \
              | fzf --multi --inline-info --reverse --height 95%)
  
  commandline -f repaint end-of-line
  commandline -a "$fgfiles"
end

bind \ct _fzf_general_files

# General purpose fzf widget (searches for directories).
function _fzf_general_dirs
  clear

  set fgdirs (fd --type d --hidden --follow --exclude .git \
             | fzf --multi --inline-info --reverse --height 95%)
  
  commandline -f repaint end-of-line
  commandline -a "$fgdirs"
end

bind \et _fzf_general_dirs

# Make accept-autosuggestion work better.
bind \e\  accept-autosuggestion execute
bind \cl  accept-autosuggestion

# Port of the oh-my-zsh sudo plugin for fish.
function _desc_sudo
    commandline -C 0
    commandline -i 'sudo '
    commandline -f end-of-line
end

bind \cs _desc_sudo
