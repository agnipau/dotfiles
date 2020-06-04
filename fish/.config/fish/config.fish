set fish_greeting ""

fish_vi_key_bindings
function fish_mode_prompt --description 'Displays the current mode'
    return
    if test "$fish_key_bindings" = "fish_vi_key_bindings"
        switch $fish_bind_mode
            case default
            case insert
                set_color --bold green
            case replace_one
                set_color --bold green
            case visual
                set_color --bold brmagenta
        end
        echo '•'
        set_color normal
        printf " "
    end
end


set -x EDITOR /usr/bin/kak
set -x BROWSER /usr/bin/chromium
set -e PAGER
set -x SUDO_ASKPASS /home/matte/bin/rofiecho
set -x GOPATH /home/matte/go
set -x TERMINAL /usr/bin/alacritty
set -x STATUSBAR /usr/bin/polybar
set -x TESSDATA_PREFIX /usr/share/tessdata
set -x SXHKD_SHELL /usr/bin/sh
set -x TERM xterm-256color
set -x JAVA_HOME /usr/lib/jvm/java-8-openjdk
set -x DOTNET_CLI_TELEMETRY_OPTOUT true
set -x XDG_CONFIG_HOME /home/matte/.config
set -x ANDROID_SDK_ROOT /opt/android-sdk
# set -x JAVA_OPTS '-XX:+IgnoreUnrecognizedVMOptions --add-modules java.se.ee'
set -x ANDROID_HOME $ANDROID_SDK_ROOT
set -x PATH \
    /home/matte/bin \
    /home/matte/pbin \
    /home/matte/dev/flutter/bin \
    /home/matte/.cargo/bin \
    $GOPATH/bin \
    /home/matte/.luarocks/bin \
    /home/matte/.pub-cache/bin \
    $ANDROID_HOME/tools \
    $ANDROID_HOME/tools/bin \
    $ANDROID_HOME/platform-tools \
    $ANDROID_HOME/emulator \
    /home/matte/.local/bin \
    $PATH

set -x FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
set -x FZF_DEFAULT_OPTS "
  --multi --inline-info --reverse --height 95%
  --color fg:8,hl:7,fg+:6,bg+:0,hl+:7
  --color info:0,prompt:6,spinner:6,pointer:6,marker:6
"

abbr ref "sudo reflector --verbose --sort rate --save /etc/pacman.d/mirrorlist"
abbr uupd "yay --color=always -Syyuv"
abbr upd "yay --color=always -Syuv"
abbr autorem "yay --color=always -R (yay -Qdtq)"
abbr mkdir "mkdir -p"
abbr installed "yay --color=never -Qe | kak"
abbr src "yay --color=always -Ss"
abbr ins "yay -S --needed --noconfirm"
abbr pygm "pygmentize -f png -O 'font_name=Input Mono Narrow,font_size=32' -o pygmentscreen.png script.py"
abbr pinfo "yay -Qi --color=always"
abbr rpinfo "yay -Si --color=always"
abbr rem "yay -R --noconfirm"
abbr ls "exa -lh -s type"
abbr la "exa -lah -s type"
abbr t "tmux -u"
abbr bon "bluetoothctl power on"
abbr dl "curl -LOC -"
abbr cpp "rsync -ah --progress"
abbr rmf "rm"
abbr glog "git log --no-color"
abbr rm "trash --"
abbr q "exit"
abbr rml "trash-list"
abbr rmr "trash-restore"
abbr rme "trash-empty"
abbr k "xset r rate 200 40; sudo localectl set-x11-keymap us pc105 intl caps:ctrl_modifier"
abbr airpods "bluetoothctl -- connect 7C:9A:1D:C1:32:5F"
abbr reboot "read -P 'Sei sicuro di volere riavviare? ' && systemctl reboot"
abbr poweroff "read -P 'Sei sicuro di volere spegnere? ' && systemctl poweroff"
abbr suspend "read -P 'Sei sicuro di volere sospendere? ' && systemctl suspend"
abbr bar "polybar main &disown"
abbr cpolybar "kak ~/.config/polybar/config"
abbr spolybar "pkill polybar; polybar main &disown"
# TODO: si3
abbr ci3 "kak ~/.config/i3/config"
abbr shc "shellcheck --enable=all"
abbr cfish "kak ~/.config/fish/config.fish"
abbr sfish "source ~/.config/fish/config.fish"
abbr cbash "kak ~/.bashrc"
abbr bc "insect"
abbr ctmux "kak ~/.tmux.conf"
abbr stmux "tmux source-file ~/.tmux.conf"
abbr calacritty "kak ~/.config/alacritty/alacritty.yml"
abbr cd "z"
abbr lbar "lemon | lemonbar -g 2560x70 -b -B '#ff1d2021' -F '#ffebdbb2' -p -f 'Input Mono Narrow:size=13' -o -20 | sh"
abbr dmenu "dmenu -fn 'Input Mono Narrow' -nf '#545454' -sf '#ffffff' -sb '#212121'"

zoxide init fish | source

# Anirak
set color_grey = "757c87"
set selection_color = "15194c"
# # Doom spacegrey
# set color_grey = "65737e"
# # Doom one dark
# set color_grey = "5b6268"
# Gruvbox dark
# set color_grey = "a89984"
# Nord
# set color_grey = "616e88"
# Material darker
# set color_grey = "545454"

set fish_color_normal            white
set fish_color_command           --bold white
set fish_color_quote             green
set fish_color_redirection       cyan
set fish_color_end               --bold black
set fish_color_error             red
set fish_color_param             white
set fish_color_comment           --bold black
set fish_color_search_match      --background=blue
set fish_color_operator          --bold yellow
set fish_color_escape            magenta
set fish_color_autosuggestion    $color_grey
set fish_color_cancel            --bold red
set fish_pager_color_completion  $color_grey
set fish_pager_color_description $color_grey
set fish_pager_color_prefix      --bold white

bass (ssh-agent -s) >/dev/null

# Start tmux automatically whenever a new terminal instance is opened.
test -z $TMUX;
  and test $DISPLAY;
  and tmux -u

# Start X automatically only if in tty1
test -z $DISPLAY;
    and test (tty) = /dev/tty1;
    and startx

