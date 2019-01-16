# .bashrc
#
# bash config file.

# If not running interactively, don't do anything:
[[ $- != *i* ]] && return

# Prompt.
prompt() {
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    gbranch="$(git rev-parse --abbrev-ref HEAD 2>/dev/null)"
    gdirty="$(git status --porcelain --ignore-submodules 2>/dev/null)"

    if [[ "$gdirty" ]]; then
      if [[ "$PREFIX" ]]; then
        printf "%s%s%s%s" "\\[\\e[1m\\]\\[\\e[3;34m\\]\\W\\[\\e[0m\\]" \
                          "\\[\\e[1;32m\\] on  ${gbranch}\\[\\e[0m\\]" \
                          "\\[\\e[1;34m\\] ✘\\[\\e[0m\\]" \
                          "\\[\\e[1;3\${?/#0/7}m\\] :: \\[\\e[0;37m\\]"
      else
        printf "%s%s%s%s" "\\[\\e[1m\\]\\[\\e[3;34m\\]\\w\\[\\e[0m\\]" \
                          "\\[\\e[1;32m\\] on  ${gbranch}\\[\\e[0m\\]" \
                          "\\[\\e[1;34m\\] ✘\\[\\e[0m\\]" \
                          "\\[\\e[1;3\${?/#0/7}m\\] :: \\[\\e[0;37m\\]"
      fi
    else
      if [[ "$PREFIX" ]]; then
        printf "%s%s%s" "\\[\\e[1m\\]\\[\\e[3;34m\\]\\W\\[\\e[0m\\]" \
                        "\\[\\e[1;32m\\] on  ${gbranch}\\[\\e[0m\\]" \
                        "\\[\\e[1;3\${?/#0/7}m\\] :: \\[\\e[0;37m\\]"
      else
       printf "%s%s%s" "\\[\\e[1m\\]\\[\\e[3;34m\\]\\w\\[\\e[0m\\]" \
                       "\\[\\e[1;32m\\] on  ${gbranch}\\[\\e[0m\\]" \
                       "\\[\\e[1;3\${?/#0/7}m\\] :: \\[\\e[0;37m\\]"
      fi
    fi
  else
    if [[ "$PREFIX" ]]; then
      printf "%s%s" "\\[\\e[1m\\]\\[\\e[3;34m\\]\\W\\[\\e[0m\\]" \
                    "\\[\\e[1;3\${?/#0/7}m\\] :: \\[\\e[0;37m\\]"
    else
      printf "%s%s" "\\[\\e[1m\\]\\[\\e[3;34m\\]\\w\\[\\e[0m\\]" \
                    "\\[\\e[1;3\${?/#0/7}m\\] :: \\[\\e[0;37m\\]"
    fi
  fi
}

if [[ -z "$PREFIX" ]]; then
  PROMPT_COMMAND='PS1=$(prompt); echo -ne "\033]0; \007"'
else
  PROMPT_COMMAND='PS1=$(prompt)'
fi

# Envars.
export HISTCONTROL="ignoredups"
export HISTSIZE=1000000
export GOPATH="${HOME}/go"
export PATH="${GOPATH}:${GOPATH}/bin:${HOME}/.phantomjs/bin:${HOME}/bin:${PATH}"
export VISUAL="/usr/bin/nvim"
export EDITOR="/usr/bin/nvim"
export BROWSER="/usr/bin/chromium"
export RTV_BROWSER="/usr/bin/w3m"
export LANG="it_IT.UTF-8"
export XDG_CONFIG_HOME="${HOME}/.config"
export SSH_KEY_PATH="${HOME}/.ssh/id_rsa"
export RANGER_LOAD_DEFAULT_RC="false"
export MANPAGER="nvim -c MANPAGER -"
export FFF_FAV1="${HOME}/progetti"
export FFF_FAV2="${HOME}/roba"
export FFF_FAV5="/media"
export FFF_FAV6="/mnt"
#export PROMPT_COMMAND='echo -ne "\033]0;$PWD\007"'

# Better tab completion.
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

# Misc. aliases.
alias ydb='cd ${HOME}/progetti/ydb && ./ydb'
alias obapp='obxprop | rg ^_OB_APP_'
alias app='xprop | rg ^WM_'
alias nodebug='notify-send "Debug" "Debug message"'
alias cnodebug='notify-send -h string:fgcolor:"$color1" "Debug" "Debug message"'
alias grad='. ${HOME}/.bashrc; hsetroot -add "$color1" -add "$color2" -gradient 0'
alias solid='. ${HOME}/.bashrc; hsetroot -solid "$color1"'
alias discord='beautifuldiscord --css "${HOME}/.cache/wal-discord/style.css"'
alias down='curl -fsSLO'
alias sdown='curl -fSLO#'
alias sudo='sudo -p "$(tput bold)$(tput setaf 1)>> $(tput sgr0)"'
alias ore='date +%H:%M:%S'
alias data='date "+%d %B %Y"'

# Short aliases.
alias m='alsamixer'
alias c='clear'
alias q='exit'
alias cq='clear; exit'
alias :q='exit'
alias :q!='exit'
alias :wq='exit'
alias ZZ='exit'
alias ZQ='exit'
alias t='tmux -2'
alias p='ping google.com'
alias g='gcc a.c'
alias a='./a.out'
alias n='nvim a.c'
alias f='fff'
alias wp='while true; do sleep 1s; ping -c 3 google.com && break; done'
alias pd='pdflatex *.tex'
alias ist='cd ${HOME}/srcs/st && sudo make clean install && exit'
alias rma='rm -rf ./*'
alias lp='~/bin/arch-list-pkgs; ~/bin/aur-list-pkgs'
alias wi='sudo wifi-menu'
alias sp='curl -o /dev/null http://test.kpnqwest.it/file2000.bin'

# Git aliases.
alias ga='git add .'
alias gm='git commit -m'
alias gps='git push'
alias gpl='git pull'
alias gpla='cd "${HOME}/progetti"; for i in *; do echo "$i"; cd "$i"; git pull; cd ..; done'
alias gs='git status'
alias gsa='cd "${HOME}/progetti"; for i in *; do echo "$i"; cd "$i"; git status; cd ..; done'
alias gr='git remote -v'
alias gl='git log'
alias lg='lazygit'

# Make programs human readable/faster to type.
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
#shellcheck disable=SC2142
alias pqiv='pqiv -i --box-colors="$color7":"$color0_lighter_90" --bind-key="@MONTAGE { h { montage_mode_shift_x(-1) } }" --bind-key="@MONTAGE { j { montage_mode_shift_y(1) } }" --bind-key "@MONTAGE { k { montage_mode_shift_y(-1) } }" --bind-key "@MONTAGE { l { montage_mode_shift_x(1) } }" --bind-key="j { goto_file_relative(-1) }" --bind-key="k { goto_file_relative(1) }" --bind-key="h { goto_file_relative(-1) }" --bind-key="l { goto_file_relative(1) }" --bind-key="d { command(rm $1) }"'
alias neo='clear; neofetch'

# Aliases for editing configuration files.
alias ebash='nvim "${HOME}/.bashrc"'
alias envim='nvim "${HOME}/.config/nvim/init.vim"'
alias rnvim='nvim README* || nvim readme*'
alias tnvim='nvim *.tex'
alias exres='nvim "${HOME}/.Xresources"'
alias ebox='nvim "${HOME}/.config/openbox/rc.xml"'
alias emux='nvim "${HOME}/.tmux.conf"'
alias ebar='nvim "${HOME}/.config/polybar/config"'

# Aliases for sourcing configuration files.
alias ibash='. "${HOME}/.bashrc"'
alias ixres='xrdb "${HOME}/.Xresources"'
alias ibox='openbox --reconfigure'
alias imux='tmux source-file "${HOME}/.tmux.conf"'
alias ibar='"${HOME}/bin/polyop"'

# Aliases for fixing typos.
alias dc='cd'
alias sl='ls'
alias nivm='nvim'
alias cd..='cd ..'

# Grep aliases.
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# System aliases.
if [[ -z "$PREFIX" ]]; then
  # Arch Linux aliases.
  alias pacman='pacman --color=auto'
  alias yay='yay --color=auto'
  alias upd='sudo pacman -Syu --noconfirm --color=auto'
  alias aupd='yay -Syu --noconfirm'
  alias ins='sudo pacman -S --needed --noconfirm --color=auto'
  alias ains='yay -S --needed --noconfirm'
  alias rem='sudo pacman -Rnsu --noconfirm --color=auto'
  alias srem='sudo pacman -Rnu --noconfirm --color=auto'
  alias arem='yay -Rsu --noconfirm'
  alias autorem='sudo pacman -Rsu $(pacman -Qdtq) --color=auto'
  alias src='pacman -Ss'
  alias asrc='yay -Ss'
  alias info='pacman -Qi'
elif [[ "$PREFIX" ]]; then
  # Termux aliases.
  alias upd='pkg update'
  alias upg='pkg upgrade'
  alias ins='pkg install'
  alias rem='pkg remove'
  alias autorem='apt autoremove'
  alias src='pkg search'
fi

# System management aliases.
alias po='poweroff'
alias re='reboot'

# Add colors to man pages.
export LESS_TERMCAP_mb=$'\e[0;33m'
export LESS_TERMCAP_md=$'\e[0;35m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;34;31m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[0;32m'

# fzf options.
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
export FZF_DEFAULT_OPTS="
  --multi --inline-info --reverse --height 95%
  --color fg:8,hl:1,fg+:1,bg+:0,hl+:7
  --color info:0,prompt:1,spinner:1,pointer:1,marker:1
"

# Custom fzf functions.
fzf_nvim() {
  [[ "$1" ]] && \
    nvim "$@"
}

fzf_cd() {
  clear
  dir="$(fd --type d --hidden --follow --exclude .git | fzf)"

  [[ "$dir" ]] && \
    cd "$dir" || exit 1
}

fzf_history() {
  clear
  #shellcheck disable=SC2002
  echo -n "$(cat "${HOME}/.bash_history" | fzf)" > .fzf_his.tmp
  #shellcheck disable=SC1091
  . ./.fzf_his.tmp
  rm -f .fzf_his*
}

fzf_general() {
  clear
  #shellcheck disable=SC2016
  echo -n '$(fd --hidden --follow --exclude .git | fzf)' >> .fzf_cmd.tmp
  #shellcheck disable=SC1091
  . ./.fzf_cmd.tmp
  rm -f .fzf_cmd*
}

# Custom fzf bindings.
#shellcheck disable=SC2016
bind -x '"\C-k": clear; fzf_nvim $(fzf)'
bind -x '"\C-r": fzf_history'
bind '"\ec": "fzf_cd\C-m"'
bind '"\C-t": "\" > .fzf_cmd.tmp\e0iecho -n \"\C-mfzf_general\C-m'

# Run tmux every time a new terminal instance is opened.
#[[ -z "$TMUX" && "$DISPLAY" ]] && tmux -2

# More complicated aliases / Misc. functions.
clone() {
  git clone --depth 1 "https://github.com/$1.git"
}

cclone() {
  git clone --depth 1 "$1.git"
}
