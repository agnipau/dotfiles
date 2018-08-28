# zle.zsh
#
# Contains some useful zle widgets.

# Open the results of fzf in NeoVim.
_fzf-nvim() {
  clear

  nvim $(fd --type f --hidden --follow --exclude .git \
        | fzf --multi --inline-info --reverse --height 95%)
  
  BUFFER="clear"
  zle accept-line
}
zle -N _fzf-nvim
bindkey '^e' _fzf-nvim

# cd into the result of fzf.
_fzf-cd() {
  clear

  fzf_dir="$(fd --type d --hidden --follow --exclude .git \
            | fzf --multi --inline-info --reverse --height 95%)"
  [[ "$fzf_dir" ]] && \
    cd "$fzf_dir"

  BUFFER="clear"
  zle accept-line
}
zle -N _fzf-cd
bindkey '\ec' _fzf-cd

# Search with fd and fzf through the history.
_fzf-history() {
  clear

  BUFFER="$(cat "${HOME}/.bash_history" \
           | fzf --multi --inline-info --reverse --height 95%)"
  zle accept-line
}
zle -N _fzf-history
bindkey '^r' _fzf-history

# Just a shortcut to the normal fzf.
_fzf-general() {
  OLD_BUFFER="$BUFFER"
  clear

  fzf_result="$(fd --hidden --follow --exclude .git \
               | fzf --multi --inline-info --reverse --height 95%)"

  clear
  zle reset-prompt

  BUFFER="${OLD_BUFFER}${fzf_result}"
  zle accept-line
}
zle -N _fzf-general
bindkey '^t' _fzf-general

# A version of the oh-my-zsh sudo plugin that works in vi mode
# (obv it works in every mode).
_sudo() {
  OLD_BUFFER="$BUFFER"
  BUFFER="sudo $OLD_BUFFER"
  zle end-of-line
}
zle -N _sudo
bindkey '\e\e' _sudo
