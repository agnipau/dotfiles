#
# .bashrc
#

# If not running interactively, don't do anything:
[[ $- != *i* ]] && return

# Prompt
PS1="\[\e[1;33m\]\u \[\e[3;32m\]\w\[\e[0m\] \[\e[1;31m\]>\[\e[0;37m\] "
#PS1="➜  "

# Envars
export HISTCONTROL="ignoredups"
export HISTSIZE=1000000
export PATH="$HOME/.phantomjs:$HOME/bin:$HOME/.gem/ruby/2.5.0/bin:$PATH"
export VISUAL="/usr/bin/nvim"
export EDITOR="/usr/bin/nvim"
export BROWSER="/usr/bin/chromium"
export RTV_BROWSER="/usr/bin/w3m"
export LANG="it_IT.UTF-8"
export XDG_CONFIG_HOME="$HOME/.config"
export SSH_KEY_PATH="$HOME/.ssh/id_rsa"
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

# Aliases
alias ore='date +%H:%M'
alias data='date +"%A %d %B"'
alias ist='cd $HOME/srcs/st && sudo make clean install && exit'
alias c='clear'
alias q='exit'
alias gs='git status'
alias ggo='git add -A; git commit -m "update"'
alias ggg='git add -A; git commit -m "update"; git push'
alias clone='git clone --depth=1'
alias wp='while true; do sleep 1s; ping -c 3 google.com && break; done'
alias p='ping google.com'
alias spdtst='curl -o /dev/null http://test.kpnqwest.it/file2000.bin'
alias baydl='cd $HOME/progetti/youtube-dl-batchfiles && ./baydl.sh'
alias ls='/opt/coreutils/bin/ls --group-directories-first --color=auto'
alias l.="ls -A | egrep '^\.'"
alias la='ls -Alh'
alias df='df -h'
alias du='du -h'
alias dc='cd'
alias sl='ls'
alias nivm='nvim'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias upd='sudo xbps-install -Suyv'
alias ins='sudo xbps-install -Syv'
alias rem='sudo xbps-remove -Ryv'
alias arem='sudo xbps-remove -ROoyv'
alias src='xbps-query -Rs'
alias dep='xbps-query -Rx'
alias po='sudo poweroff'
alias re='sudo reboot'
alias sa='. $HOME/bin/ssh-set'
alias fixwifi="sudo modprobe -r iwlmvm; sudo modprobe iwlmvm"
alias m='alsamixer'
alias mv='mv -i'
alias obapp='obxprop | grep ^_OB_APP_'
alias app='xprop | grep ^WM_'
alias nodebug='notify-send "Debug" "Debug message"'
alias cnodebug='notify-send -h string:fgcolor:$color1 "Debug" "Debug message"'
alias grad='. $HOME/.bashrc; hsetroot -add $color1 -add $color2 -gradient 0'
alias solid='. $HOME/.bashrc; hsetroot -solid $color1'

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

. "$HOME/.cache/wal/colors.sh"

[[ -f "$HOME/.fzf.bash" ]] && . "$HOME/.fzf.bash"

[[ -f "$HOME/.local/share/icons-in-terminal/icons_bash.sh" ]] && . \
  "$HOME/.local/share/icons-in-terminal/icons_bash.sh"
