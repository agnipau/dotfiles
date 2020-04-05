# If not running interactively, don't do anything
[[ $- != *i* ]] && return

git_branch() {
    ecode="$?"

    inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"
    [[ "$inside_git_repo" ]] && (
        git_branch="$(git rev-parse --abbrev-ref HEAD 2>/dev/null)"
        git_dirty="$(git status --porcelain --ignore-submodules 2>/dev/null)"
        echo -ne "\e[1;32mon  $git_branch\e[0m"
        [[ "$git_dirty" ]] && echo -ne " \e[1;36m✘\e[0m"
        echo -n ' '
    )

    [[ "$ecode" == "0" ]] && echo -ne '\e[1;37m' || echo -ne '\e[1;31m'
    echo -e '::\e[0m '
}
PS1='\[\e[3m\]\[\e[1;34m\]\w\[\e[0m\] `git_branch`'

[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash
source /home/matte/.config/broot/launcher/bash/br
eval "$(zoxide init bash)"

export EDITOR=/usr/bin/nvim
export BROWSER=/usr/bin/chromium
export PAGER=/usr/bin/nvim
export SUDO_ASKPASS=/home/matte/bin/rofiecho
export TERMINAL=/usr/bin/alacritty
export STATUSBAR=/usr/bin/polybar
export SXHKD_SHELL=/usr/bin/sh
export TERM=xterm-256color
export JAVE_HOME=/usr/lib/jvm/java-8-openjdk/bin
export DOTNET_CLI_TELEMETRY_OPTOUT=true
export XDG_CONFIG_HOME=/home/matte/.config
export ANDROID_SDK_ROOT=/home/matte/Android/Sdk
export ANDROID_HOME="$ANDROID_SDK_ROOT"
export PATH="/home/matte/bin:/home/matte/dev/flutter/bin:/home/matte/.pub-cache/bin:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:/home/matte/.local/bin:$PATH"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS="
  --multi --inline-info --reverse --height 95%
  --color fg:8,hl:7,fg+:6,bg+:0,hl+:7
  --color info:0,prompt:6,spinner:6,pointer:6,marker:6
"
export MANPAGER="/bin/sh -c \"col -b | nvim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""

alias uupd="yay --color=always -Syyuv"
alias upd="yay --color=always -Syuv"
alias autorem="yay --color=always -R $(yay -Qdtq)"
alias installed="yay --color=always -Qe"
alias src="yay --color=always -Ss"
alias ins="yay -S --needed --noconfirm"
alias pinfo="yay -Qi --color=always"
alias rem="yay -R --noconfirm"
alias ls="exa -lh"
alias la="exa -lah"
alias t="tmux -u"
alias bon="bluetoothctl power on"
alias dl="curl -LOC -"
alias cpp="rsync -ah --progress"
alias rmf="rm"
alias rm="trash"
alias rml="trash-list"
alias rmr="trash-restore"
alias rme="trash-empty"
alias k="xset r rate 200 40; setxkbmap -model pc105 -layout us -variant intl -option ''"
alias airpods="bluetoothctl -- connect 7C:9A:1D:C1:32:5F"
alias reboot="read -P 'Sei sicuro di volere riavviare? ' && systemctl reboot"
alias poweroff="read -P 'Sei sicuro di volere spegnere? ' && systemctl shutdown"
alias suspend="read -P 'Sei sicuro di volere sospendere? ' && systemctl suspend"
alias bar="polybar main &disown"
alias cpolybar="nvim ~/.config/polybar/config"
alias spolybar="pkill polybar; polybar main &disown"
# TODO: si3
alias ci3="nvim ~/.config/i3/config"
alias cnvim="nvim ~/.config/nvim/init.vim"
alias cfish="nvim ~/.config/fish/config.fish"
alias sfish="source ~/.config/fish/config.fish"
alias cbash="nvim ~/.bashrc"
alias ctmux="nvim ~/.tmux.conf"
alias stmux="tmux source-file ~/.tmux.conf"
alias calacritty="nvim ~/.config/alacritty/alacritty.yml"
alias cd="z"
alias dmenu="dmenu -fn 'Input Mono Narrow' -nf '#545454' -sf '#ffffff' -sb '#212121'"

# # Start tmux automatically whenever a new terminal instance is opened.
# [[ -z "$TMUX" ]] && [[ "$DISPLAY" ]] && tmux -u

# Start X automatically
[[ -z "$DISPLAY" ]] && startx

