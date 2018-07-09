#
# .bashrc
#


# If not running interactively, don't do anything:
[[ $- != *i* ]] && return


# Prompt
PS1="\[\e[1;33m\]\u \[\e[3;32m\]\w\[\e[0m\] \[\e[1;31m\]>\[\e[0;37m\] "
#PS1="➜ "


# Envars
export HISTCONTROL=ignoredups
export HISTSIZE=1000000
export PATH=$HOME/progetti/youtube-dl-batchfiles/.phantomjs/phantomjs-2.1.1-linux-x86_64/bin:$HOME/.cargo/bin:$HOME/bin:$HOME/bin/color:$HOME/.gem/ruby/2.5.0/bin:$PATH
export VISUAL=/usr/bin/nvim
export EDITOR=/usr/bin/nvim
export BROWSER=/usr/bin/chromium
export RTV_BROWSER=/usr/bin/w3m
export LANG=it_IT.UTF-8
export XDG_CONFIG_HOME=$HOME/.config
export SSH_KEY_PATH=$HOME/.ssh/id_rsa
#export PROMPT_COMMAND='echo -ne "\033]0;$PWD\007"'


# Better tab completion and other bindings
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


# Tmux
alias tmux='tmux -f $HOME/.config/tmux/tmux.conf'
alias mux='tmuxinator'


# Time related
#alias ore='date +%H:%M'
#alias data='date +"%A %d %B"'


# Source editing and compiling
alias envim='nvim $HOME/.config/nvim/init.vim'
alias ebash='nvim $HOME/.bashrc'
alias ewpa='sudo nvim /etc/wpa_supplicant/wpa_supplicant.conf'
alias ebox='nvim $HOME/.config/openbox/rc.xml'
alias ebspwm='nvim $HOME/.config/bspwm/bspwmrc'
alias esxhkd='nvim $HOME/.config/sxhkd/sxhkdrc'
alias etheme='nvim $HOME/.themes/agnipau/openbox-3/themerc'
alias emenu='nvim $HOME/.config/openbox/menu.xml'
alias eauto='nvim $HOME/.config/openbox/autostart'
alias e2bwm='nvim $HOME/srcs/2bwm/config.h'
alias est='nvim $HOME/srcs/st/config.h'
alias ist='cd $HOME/srcs/st && sudo make clean install && exit'
alias i2bwm='cd $HOME/srcs/2bwm && sudo make clean install && cd -'
alias ibash='. $HOME/.bashrc'
alias exre='nvim $HOME/.Xresources'
alias ixre='xrdb -load $HOME/.Xresources'


# Inspired by zsh's cd ... thing
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'


# Yeah, that's pretty strange
alias c='clear'
alias cl='clear; ls'
alias cls='clear; ls'
alias csl='clear; ls'
alias cdc='cd; clear'
alias cdcl='cd; clear; ls'
alias q='exit; quit'
alias cq='clear; exit; quit'
alias e='exit; quit'
alias ce='clear; exit; quit'
alias x='exit; quit'
alias cx='clear; exit; quit'


# Git
alias gpush='git push'
alias gpull='git pull'
alias ga='git add -A'
alias gc='git commit'
alias gl='git log'
alias gv='git remote -v'
alias clone='git clone --depth=1'


# Ping and internet connection related aliases
alias wp='while true; do sleep 1s; ping -c 3 google.com && break; done'
alias p='ping google.com'
alias spdtst='curl -o /dev/null http://test.kpnqwest.it/file2000.bin'


# Personal git projects related aliases
alias baydl='cd $HOME/progetti/youtube-dl-batchfiles && ./baydl.sh'
alias dots='cd $HOME/progetti/dotfiles; ls'
alias tct='cd $HOME/progetti/termux-ct; ls'
alias cinema='cd $HOME/progetti/youtube-dl-batchfiles/downloaded; ls'
alias anime='cd $HOME/progetti/youtube-dl-batchfiles/batch-files/anime; ls'
alias serie='cd $HOME/progetti/youtube-dl-batchfiles/batch-files/serie; ls'
alias film='cd $HOME/progetti/youtube-dl-batchfiles/batch-files/film; ls'
alias cinema-clear='rm -rf $HOME/progetti/youtube-dl-batchfiles/downloaded/*'


# Human readable / list aliases
alias ls='/opt/coreutils/bin/ls --group-directories-first --color=auto'
alias l='ls'
alias l.='ls -A | egrep '^\.''
alias la='ls -Alh'
alias ls-home='ls $HOME/*'
alias df='df -h'
alias du='du -h'


# Fix obvious typo's
alias cd..='cd ..'
alias dc='cd'
alias sl='ls'
alias pdw='pwd'
alias nivm='nvim'
alias nvimv='nvim'


# Colorize grep output (useful for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'


# Void Linux aliases
alias upd='sudo xbps-install -Suyv'
alias ins='sudo xbps-install -Syv'
alias rem='sudo xbps-remove -Ryv'
alias arem='sudo xbps-remove -ROoyv'
alias src='xbps-query -Rs'
alias dep='xbps-query -Rx'


# System management
alias po='sudo poweroff'
alias re='sudo reboot'


# Other
alias fixwifi="sudo modprobe -r iwlmvm; sudo modprobe iwlmvm"
alias m='alsamixer'
alias n='nvim'
alias nfzf='nvim $(fzf)'
alias neofetch='clear; neofetch'
alias ydl='youtube-dl'
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
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--multi --inline-info'
export FZF_CTRL_T_OPTS="$FZF_DEFAULT_OPTS"
export FZF_CTRL_R_OPTS='--reverse'


# Source pywal colors
. "$HOME/.cache/wal/colors.sh"


# git status utility
gs() {
  [[ $# -eq 0 ]] && repo_path="$PWD"
  [[ $# -eq 1 ]] && repo_path="$HOME/progetti/$1"

  cd $repo_path || return
  cd $repo_path && git status
}


# git add -A, git commit -m "message" (when offline)
ggo() {
  if [[ $# -eq 0 ]]; then
    TIME=$(date +"%a %d %b %g at %H:%M")
    git add -A
    git commit -m "Comment: update on $TIME"
  elif [[ $# -eq 1 ]]; then
    TIME=$(date +"%a %d %b %g at %H:%M")
    git add -A
    git commit -m "Comment: $1 on $TIME"
  fi
}


# git pull; git add -A, git commit -m "message"; git push -u origin master (when online)
ggg() {
  if [[ $# -eq 0 ]]; then
    TIME=$(date +"%a %d %b %g at %H:%M")
    git pull
    git add -A
    git commit -m "Comment: update on $TIME"
    git push -u origin master
  elif [[ $# -eq 1 ]]; then
    TIME=$(date +"%a %d %b %g at %H:%M")
    git pull
    git add -A
    git commit -m "Comment: $1 on $TIME"
    git push -u origin master
  fi
}


# Prints the output of git status for every project of mine
gsa() {
  original_dir="$PWD"

  [[ $# -eq 0 ]] && path="$HOME/progetti" && cd $path
  [[ $# -eq 1 ]] && path="$1" && cd $path

  for i in $(ls); do cd $i; echo -e "\n\n==> $i"; git status; cd ..; done; echo; cd $original_dir
}


# git pull for lightweight repos
gpuller() {
  original_dir="$PWD"

  [[ $# -eq 1 ]] && path="$1" && cd $path
  [[ $# -eq 0 ]] && path="$HOME/progetti" && cd $path

  for i in $(ls); do if [[ "$i" != 'void-packages' ]]; then cd $i; echo -e "\n==> $i"; git pull; cd ..; fi; done; echo; cd $original_dir
}


# git pull for every repo
gpuller-all() {
  original_dir="$PWD"

  [[ $# -eq 1 ]] && path="$1" && cd $path
  [[ $# -eq 0 ]] && path="$HOME/progetti" && cd $path

  for i in $(ls); do cd $i; echo -e "\n==> $i"; git pull; cd ..; done; echo; cd $original_dir
}


# Set the git remote repository url to use with SSH, can't do it in a better way because I use both GitHub and GitLab (free private repos hehehe)
git-remote-setter() {
  original_dir="$PWD"

  cd $HOME/progetti/dotfiles
  git remote set-url origin git@github.com:matteoguarda/dotfiles.git
  cd $HOME/progetti/termux-ct
  git remote set-url origin git@github.com:matteoguarda/termux-ct.git
  cd $HOME/progetti/void-packages
  git remote set-url origin git@github.com:matteoguarda/void-packages.git
  cd $HOME/progetti/youtube-dl-batchfiles
  git remote set-url origin git@github.com:matteoguarda/youtube-dl-batchfiles.git
  cd $HOME/progetti/wal.tdesktop-theme
  git remote set-url origin git@github.com:matteoguarda/wal.tdesktop-theme.git

  cd $HOME/progetti/wallpapers
  git remote set-url origin git@gitlab.com:matteoguarda/wallpapers.git
  cd $HOME/progetti/srcsbak
  git remote set-url origin git@gitlab.com:matteoguarda/srcsbak.git
  cd $HOME/progetti/fonts
  git remote set-url origin git@gitlab.com:matteoguarda/fonts.git
  cd $HOME/progetti/altro
  git remote set-url origin git@gitlab.com:matteoguarda/altro.git

  echo '==> Done!'
  cd $original_dir
}


# Open in NeoVim all files in a dir
nvima() {
  echo
  for i in $(ls); do
    echo "  -> $i"
    read agnipau
    if [ "$agnipau" = 'q' ]; then
      exit 0
    elif [ "$agnipau" = 's' ]; then
      echo
    else
      nvim $i
    fi
  done
  echo
}


# Generate a list of installed pkgs in Void Linux
void-list-pkgs() {
  xbps-query -l | awk '{ print $2 }' | xargs -n1 xbps-uhelper getpkgname | fmt > void_installed_pkgs
  echo "==> You have installed $(cat void_installed_pkgs | wc -w) packages"
  sed -i -e 's/ discord//' -e 's/ spotify//' -e 's/ openbox//' void_installed_pkgs
}


# Setup ssh-agent
sa() {
  eval `ssh-agent -s`
  ssh-add $HOME/.ssh/id_rsa
}


# This function echoes a bunch of color codes to the terminal to demonstrate what's available.
# Each line is the color code of one forground color, out of 17 (default + 16 escapes), followed by a test use of that color on all nine background colors (default + 8 escapes).
color-test() {
  T='Xyz'  # test text

  echo -e "\n                 40m     41m     42m     43m  \
     44m     45m     46m     47m";

  for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
             '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
             '  36m' '1;36m' '  37m' '1;37m';
    do FG="${FGs// /}"
    echo -en " $FGs \033[$FG  $T  "
    for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
      do echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
    done
    echo;
  done
  echo
}


# Clean xbps cache
xbps-clean() {
  dir_size=$(cd /var/cache/xbps && du -h | tail -n1 | cut -d. -f1)
  sudo rm -rf /var/cache/xbps/*
  echo " -> Cleaned garbage succefully, for a total of $dir_size"
}


# Clean Telegram Desktop download dir
telegram-clean() {
  dir_size=$(cd $HOME/roba/Telegram\ Desktop && du -h | tail -n1 | cut -d. -f1)
  rm -rf $HOME/roba/Telegram\ Desktop/*
  echo "  -> Cleaned garbage succefully, for a total of $dir_size"
}


# Combines other clean functions
all-clean() {
  echo "==> Telegram:"
  telegram-clean
  echo "==> xbps cache:"
  xbps-clean
}


# Start tmux as soon as a new shell instance is initiated (if uncommented)
#[[ -z "$TMUX" ]] && exec tmux


# Source fzf
[[ -f "$HOME/.fzf.bash" ]] && . "$HOME/.fzf.bash"


# Source icons-in-terminal
[[ -f "$HOME/.local/share/icons-in-terminal/icons_bash.sh" ]] && . "$HOME/.local/share/icons-in-terminal/icons_bash.sh"
