#
# .bashrc
#


# If not running interactively, don't do anything:
[[ $- != *i* ]] && return


# Source pywal colors
. ${HOME}/.cache/wal/colors.sh


# Prompt
PS1="\[\e[1;33m\]\u \[\e[3;32m\]\w\[\e[0m\] \[\e[1;31m\]>\[\e[0;37m\] "


# Envars
export HISTCONTROL='ignoredups'
export HISTSIZE='1000000'
export PATH="${HOME}/progetti/youtube-dl-batchfiles/.phantomjs/phantomjs-2.1.1-linux-x86_64/bin:${HOME}/.cargo/bin:${HOME}/bin:${HOME}/bin/color:${HOME}/.gem/ruby/2.5.0/bin:${PATH}"
export VISUAL='/usr/bin/nvim'
export EDITOR='/usr/bin/nvim'
export BROWSER='/usr/bin/chromium'
export RTV_BROWSER='/usr/bin/w3m'
export LANG='it_IT.UTF-8'
export XDG_CONFIG_HOME="${HOME}/.config"
export SSH_KEY_PATH="${HOME}/.ssh/id_rsa"
export PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'


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
bind '"\e\C-l": "\C-p\C-e | less\C-m"'
bind '"\e\e": "\C-asudo \C-e"'


# Tmux
alias tmux='tmux -f ${HOME}/.config/tmux/tmux.conf'
alias mux='tmuxinator'


# Time related
alias ore='date +%H:%M'
alias data='date +"%A %d %B"'


# Source editing and compiling
alias envim='nvim ${HOME}/.config/nvim/init.vim'
alias ebash='nvim ${HOME}/.bashrc'
alias ebox='nvim ${HOME}/.config/openbox/rc.xml'
alias ebspwm='nvim ${HOME}/.config/bspwm/bspwmrc'
alias esxhkd='nvim ${HOME}/.config/sxhkd/sxhkdrc'
alias etheme='nvim ${HOME}/.themes/agnipau/openbox-3/themerc'
alias emenu='nvim ${HOME}/.config/openbox/menu.xml'
alias eauto='nvim ${HOME}/.config/openbox/autostart'
alias e2bwm='nvim ${HOME}/srcs/2bwm/config.h'
alias est='nvim ${HOME}/srcs/st/config.h'
alias ist='cd ${HOME}/srcs/st && sudo make clean install && exit'
alias i2bwm='cd ${HOME}/srcs/2bwm && sudo make clean install && cd -'
alias ibash='. ${HOME}/.bashrc'


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
alias gs='git status'
alias clone='git clone --depth=1'


# Ping and internet connection related aliases
alias wp='while true; do sleep 1s; ping -c 3 google.com && break; done'
alias p='ping google.com'
alias spdtst='curl -o /dev/null http://test.kpnqwest.it/file2000.bin'


# Personal git projects related aliases
alias baydl='cd ${HOME}/progetti/youtube-dl-batchfiles && ./baydl.sh'
alias bin='cd ${HOME}/bin/arch; ls'
alias dotfiles='cd ${HOME}/progetti/dotfiles; ls'
alias nvim-config='cd ${HOME}/progetti/nvim-config; ls'
alias termux-ct='cd ${HOME}/progetti/termux-ct; ls'
alias cinema='cd ${HOME}/progetti/youtube-dl-batchfiles/downloaded; ls'
alias anime='cd ${HOME}/progetti/youtube-dl-batchfiles/batch-files/anime; ls'
alias serie='cd ${HOME}/progetti/youtube-dl-batchfiles/batch-files/serie; ls'
alias film='cd ${HOME}/progetti/youtube-dl-batchfiles/batch-files/film; ls'
alias clear_cinema='rm -rf ${HOME}/progetti/youtube-dl-batchfiles/downloaded/*'


# Human readable / list aliases
alias ls='/opt/coreutils/bin/ls --group-directories-first --color=auto'
alias l='ls'
alias l.='ls -A | egrep '^\.''
alias la='ls -Alh'
alias ls-home='ls ${HOME}/*'
alias df='df -h'
alias duu='du -h .'
alias dua='du -h *'


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


# Arch Linux aliases (commented because I'm using Void Linux atm)
#alias pacman='pacman --color=auto'
#alias upd='sudo pacman -Syu --noconfirm'
#alias ins='sudo pacman -S --noconfirm --needed'
#alias rem='sudo pacman -R --noconfirm'
#alias arem='sudo pacman -R `pacman -Qdtq` --noconfirm'
#alias src='pacman -Ss'
#alias pkglist='pacman -Qqe >'
#alias install-pkglist='pacman --needed --noconfirm --color=auto -S - <'


# Void Linux aliases
alias upd='sudo xbps-install -Suyv'
alias ins='sudo xbps-install -Syv'
alias rem='sudo xbps-remove -Ryv'
alias arem='sudo xbps-remove -Ooyv'
alias src='xbps-query -Rs'
alias dep='xbps-query -Rx'


# System management
alias po='sudo poweroff'
alias re='sudo reboot'


# Other
alias m='alsamixer'
alias n='nvim'
alias nfzf='nvim $(fzf)'
alias todo='clear; bat ${HOME}/todo.md; echo'
alias etodo='nvim ${HOME}/todo.md'
alias neo='clear; neofetch'
alias which='type -p'
alias ydl='youtube-dl'
alias mv='mv -i'
alias obapp='obxprop | grep ^_OB_APP_'
alias app='xprop | grep ^WM_'
alias nodebug='notify-send "Debug" "Debug message"'
alias cnodebug='notify-send -h string:fgcolor:${color1} "Debug" "Debug message"'
alias down='curl -sLO'


# Add colors to man pages
export LESS_TERMCAP_mb=$'\e[0;33m'
export LESS_TERMCAP_md=$'\e[0;35m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;34;31m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[0;32m'


# Text Colors
txtner='\e[0;30m' # Black - Regular
txtros='\e[0;31m' # Red
txtver='\e[0;32m' # Green
txtgia='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtvio='\e[0;35m' # Purple
txtazz='\e[0;36m' # Cyan
txtbia='\e[0;37m' # White
graner='\e[1;30m' # Black - Bold
graros='\e[1;31m' # Red
graver='\e[1;32m' # Green
gragia='\e[1;33m' # Yellow
grablu='\e[1;34m' # Blue
gravio='\e[1;35m' # Purple
graazz='\e[1;36m' # Cyan
grabia='\e[1;37m' # White
sotner='\e[2;30m' # Black - Thin
sotros='\e[2;31m' # Red
sotver='\e[2;32m' # Green
sotgia='\e[2;33m' # Yellow
sotblu='\e[2;34m' # Blue
sotvio='\e[2;35m' # Purple
sotazz='\e[2;36m' # Cyan
sotbia='\e[2;37m' # White
corner='\e[3;30m' # Black - Italic
corros='\e[3;31m' # Red
corver='\e[3;32m' # Green
corgia='\e[3;33m' # Yellow
corblu='\e[3;34m' # Blue
corvio='\e[3;35m' # Purple
corazz='\e[3;36m' # Cyan
corbia='\e[3;37m' # White
undner='\e[4;30m' # Black - Underline
undros='\e[4;31m' # Red
undver='\e[4;32m' # Green
undgia='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undvio='\e[4;35m' # Purple
undazz='\e[4;36m' # Cyan
undbia='\e[4;37m' # White
lamner='\e[5;30m' # Black - Blink
lamros='\e[5;31m' # Red
lamver='\e[5;32m' # Green
lamgia='\e[5;33m' # Yellow
lamblu='\e[5;34m' # Blue
lamvio='\e[5;35m' # Purple
lamazz='\e[5;36m' # Cyan
lambia='\e[5;37m' # White
bakner='\e[7;30m' # Black - Background
bakros='\e[7;31m' # Red
bakver='\e[7;32m' # Green
bakgia='\e[7;33m' # Yellow
bakblu='\e[7;34m' # Blue
bakvio='\e[7;35m' # Purple
bakazz='\e[7;36m' # Cyan
bakbia='\e[7;37m' # White
barner='\e[9;30m' # Black - Barred
barros='\e[9;31m' # Red
barver='\e[9;32m' # Green
bargia='\e[9;33m' # Yellow
barblu='\e[9;34m' # Blue
barvio='\e[9;35m' # Purple
barazz='\e[9;36m' # Cyan
barbia='\e[9;37m' # White
colres='\e[0m'    # Text Reset


# FZF options
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--multi --inline-info'
export FZF_CTRL_T_OPTS="$FZF_DEFAULT_OPTS"
export FZF_CTRL_R_OPTS='--reverse'


# Create a dir and cd into it
mkcd() {
  [[ $# -gt 1 ]] && return
  mkdir "$1" && cd "$1"
}


# Git add -A, git commit -m "message"
gg() {
  if [[ $# -eq 0 ]]; then
    TIME=$(date +"%a %d %b %g at %H:%M")
    git pull
    git add -A
    git commit -m "Comment: update on $TIME"
  elif [[ $# -eq 1 ]]; then
    TIME=$(date +"%a %d %b %g at %H:%M")
    git pull
    git add -A
    git commit -m "Comment: $1 on $TIME"
  fi
}


# Git add -A, git commit -m "message"; git push -u origin master
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

  [[ $# -eq 0 ]] && path="${HOME}/progetti" && cd $path
  [[ $# -eq 1 ]] && path="$1" && cd $path

  for i in $(ls); do cd $i; echo -e "\n\n==> $i"; git status; cd ..; done; echo; cd $original_dir
}


# git pull everywhere
gpuller() {
  original_dir="$PWD"

  [[ $# -eq 1 ]] && path="$1" && cd $path
  [[ $# -eq 0 ]] && path="${HOME}/progetti" && cd $path

  for i in $(ls); do cd $i; echo -e "\n==> $i"; git pull; cd ..; done; echo; cd $original_dir
}


# Set the git remote repository url to use with SSH, can't do it in a better way because I use both GitHub and GitLab (free private repos hehehe)
git-remote-setter() {
  original_dir="$PWD"
  cd ${HOME}/progetti/dotfiles
  git remote set-url origin git@github.com:matteoguarda/dotfiles.git
  cd ${HOME}/progetti/termux-ct
  git remote set-url origin git@github.com:matteoguarda/termux-ct.git
  cd ${HOME}/progetti/void-packages
  git remote set-url origin git@github.com:matteoguarda/void-packages.git
  cd ${HOME}/progetti/youtube-dl-batchfiles
  git remote set-url origin git@github.com:matteoguarda/youtube-dl-batchfiles.git
  cd ${HOME}/progetti/wallpapers
  git remote set-url origin git@gitlab.com:matteoguarda/wallpapers.git
  cd ${HOME}/progetti/srcsbak
  git remote set-url origin git@gitlab.com:matteoguarda/srcsbak.git
  echo "==> Done!"
}


# Open in NeoVim all files in a dir
nvima() {
  echo
  for i in $(ls); do
    echo "  -> $i"
    read agnipau
    if [ "$agnipau" = "q" ]; then
      exit 0
    elif [ "$agnipau" = "s" ]; then
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
}


# Setup ssh-agent
sa() {
  eval `ssh-agent -s`
  ssh-add ${HOME}/.ssh/id_rsa
}


# Download songs from YouTube (with metadata)
ydla() {
  youtube-dl $1 \
             --add-metadata --metadata-from-title "%(artist)s - %(title)s" \
             --extract-audio --audio-format mp3 --audio-quality 0 --prefer-ffmpeg \
             --youtube-skip-dash-manifest --ignore-errors --restrict-filenames \
             --verbose $f

  notify-send "YouTube" "Song downloaded!"
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
    do FG=${FGs// /}
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
  echo "==> Cleaned garbage succefully, for a total of $dir_size"
}


# Start tmux as soon as a new shell instance is initiated (if uncommented)
#[[ -z "$TMUX" ]] && exec tmux


# Source fzf
[[ -f "${HOME}/.fzf.bash" ]] && . ${HOME}/.fzf.bash


# Source icons-in-terminal
[[ -f "${HOME}/.local/share/icons-in-terminal/icons_bash.sh" ]] && . ${HOME}/.local/share/icons-in-terminal/icons_bash.sh
