#
# .bashrc
#

# If not running interactively, don't do anything:
[[ $- != *i* ]] && return

# Prompt (modified version of Dylan Araps's prompt)
prompt() {
    branch="$(git rev-parse --abbrev-ref HEAD 2>/dev/null)"
    printf "%s%s%s%s" "\\[\\e[1;33m\\]\\u " \
                      "\\[\\e[3;32m\\]\\w\\[\\e[0m\\]" \
                      "\\[\\e[1;33m\\]${branch:+ on  ${branch}}\\[\\e[0m\\]" \
                      "\\[\\e[1;3\${?/#0/7}m\\] > \\[\\e[0;37m\\]"
}

#PS1='\[\e[1;33m\]\u \[\e[3;32m\]\w\[\e[0m\] \[\e[1;31m\]>\[\e[0;37m\] '
#PS1='➜  '
PROMPT_COMMAND='PS1=$(prompt)'

# Envars
export HISTCONTROL="ignoredups"
export HISTSIZE=1000000
export PATH="${HOME}/bin:${HOME}/.gem/ruby/2.5.0/bin:${PATH}"
export VISUAL="/usr/bin/nvim"
export EDITOR="/usr/bin/nvim"
export BROWSER="/usr/bin/chromium"
export RTV_BROWSER="/usr/bin/w3m"
export LANG="it_IT.UTF-8"
export XDG_CONFIG_HOME="${HOME}/.config"
export SSH_KEY_PATH="${HOME}/.ssh/id_rsa"
export RANGER_LOAD_DEFAULT_RC="false"
export MANPAGER="nvim -c MANPAGER -"
#export PROMPT_COMMAND='echo -ne "\033]0;$PWD\007"'

# Better tab completion
bind 'TAB: menu-complete'
bind 'set show-all-if-ambiguous on'
bind 'set completion-ignore-case on'
bind 'set completion-map-case on'
bind 'set page-completions off'
bind 'set menu-complete-display-prefix on'
bind 'set completion-query-items 0'
bind 'set colored-stats on'
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Some precious bindings
bind '"\e\C-l": "\C-e | less\C-m"'
bind '"\e\C-b": "\C-abc -l <<< \C-m"'
bind '"\e\e": "\C-asudo \C-e"' 

# Miscellanous
alias spdtst='curl -o /dev/null http://test.kpnqwest.it/file2000.bin'
alias baydl='cd ${HOME}/progetti/youtube-dl-batchfiles && ./baydl.sh'
alias obapp='obxprop | grep ^_OB_APP_'
alias app='xprop | grep ^WM_'
alias nodebug='notify-send "Debug" "Debug message"'
alias cnodebug='notify-send -h string:fgcolor:"$color1" "Debug" "Debug message"'
alias grad='. ${HOME}/.bashrc; hsetroot -add "$color1" -add "$color2" -gradient 0'
alias solid='. ${HOME}/.bashrc; hsetroot -solid "$color1"'
alias adbpl='adb pull "/storage/emulated/0/$1" "$2"'
alias adbps='adb push "$1" "/storage/emulated/0/$2"'
alias discord='beautifuldiscord --css "${HOME}/.cache/wal-discord/style.css"'
alias down='curl -fsSLO'
alias tnvim='nvim *.tex'

# Short aliases
alias m='alsamixer'
alias c='clear'
alias q='exit'
alias t='tmux'
alias p='ping google.com'
alias wp='while true; do sleep 1s; ping -c 3 google.com && break; done'
alias pd='pdflatex *.tex'
alias ist='cd ${HOME}/srcs/st && sudo make clean install && exit'

# git aliases
alias ga='git add .'
alias gm='git commit -m'
alias gps='git push'
alias gpl='git pull'
alias gs='git status'
alias gr='git remote -v'

# Make programs human readable/faster to type
alias r='ranger'
alias ls='ls --group-directories-first --color=auto'
alias l="ls"
alias l.="ls -A | egrep '^\\.'"
alias la='ls -A'
alias ll='ls -Alh'
alias df='df -h'
alias du='du -h'
alias ll='ls -Alh'
alias mkdir='mkdir -p'
alias neo='clear; neofetch'

# Typos
alias dc='cd'
alias sl='ls'
alias nivm='nvim'
alias nvi='nvim'

# Grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Arch Linux
alias upd='sudo pacman -Syu --noconfirm'
alias aupd='aurman -Syu --noconfirm'
alias ins='sudo pacman -S --needed --noconfirm'
alias ains='aurman -S --needed --noconfirm'
alias rem='sudo pacman -Rsu --noconfirm'
alias arem='aurman -Rsu --noconfirm'
alias autorem='sudo pacman -R $(pacman -Qdtq)' 
alias src='pacman -Ss'
alias asrc='aurman -Ss'
alias dep='pacman -Qi'

# System management
alias po='poweroff'
alias re='reboot'

# Add colors to man pages
export LESS_TERMCAP_mb=$'\e[0;33m'
export LESS_TERMCAP_md=$'\e[0;35m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;34;31m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[0;32m'

# FZF options
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--multi --inline-info"
export FZF_CTRL_T_OPTS="$FZF_DEFAULT_OPTS"
export FZF_CTRL_R_OPTS="--reverse"

[[ -f "${HOME}/.fzf.bash" ]] && . "${HOME}/.fzf.bash"
[[ -z "$TMUX" && "$DISPLAY" ]] && tmux

# Use escape sequences to change color17 to $color0_lighter_40
# Change color18 to $color0_lighter_60
# I primarily need this trick for my vim status line
if [[ -f "${HOME}/.cache/wal/colors.sh" ]]; then
  . "${HOME}/.cache/wal/colors.sh"
  printf "\e]4;17;rgb:${color0_lighter_30:1:2}/${color0_lighter_30:3:2}/${color0_lighter_30:5:2}\e\\"
  #printf "\033]4;17;rgb:${color0_lighter_40:1:2}/${color0_lighter_40:3:2}/${color0_lighter_40:5:2}\007"
  printf "\e]4;18;rgb:${color0_lighter_90:1:2}/${color0_lighter_90:3:2}/${color0_lighter_90:5:2}\e\\"
  #printf "\033]4;18;rgb:${color0_lighter_60:1:2}/${color0_lighter_60:3:2}/${color0_lighter_60:5:2}\007"
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
