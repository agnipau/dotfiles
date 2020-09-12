set fish_greeting ""

fish_vi_key_bindings
bind -M insert \cf accept-autosuggestion
bind -M insert \cn execute
function fish_mode_prompt --description 'Displays the current mode'
    return
end

set -x PYTHONPATH $PYTHONPATH \
    /home/agnipau/.local/lib/python3.8/site-packages
set -x EDITOR /usr/bin/nvim
set -x BROWSER /usr/bin/chromium
set -e PAGER
set -x SUDO_ASKPASS /home/agnipau/bin/rofiecho
set -x GOPATH /home/agnipau/go
set -x TERMINAL /usr/bin/alacritty
set -x STATUSBAR /usr/bin/polybar
set -x TESSDATA_PREFIX /usr/share/tessdata
set -x SXHKD_SHELL /usr/bin/sh
set -x TERM screen-256color
set -x JAVA_HOME /usr/lib/jvm/java-8-openjdk
# set -x JAVA_HOME /usr/lib/jvm/java-11-openjdk
set -x DOTNET_CLI_TELEMETRY_OPTOUT true
set -x XDG_CONFIG_HOME /home/agnipau/.config
set -x ANDROID_SDK_ROOT /opt/android-sdk
set -x ANDROID_NDK_ROOT /opt/android-sdk/ndk/21.0.6113669
set -x JAVA_OPTS '-XX:+IgnoreUnrecognizedVMOptions'
set -x LD_LIBRARY_PATH '/usr/local/lib'
# set -x _JAVA_OPTIONS '-XX:+IgnoreUnrecognizedVMOptions -Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'
set -x _JAVA_AWT_WM_NONREPARENTING 1
set -x ANDROID_HOME $ANDROID_SDK_ROOT
set -x PATH \
    /home/agnipau/bin \
    /home/agnipau/pbin \
    /home/agnipau/dev/flutter/bin \
    /home/agnipau/.gem/ruby/2.7.0/bin \
    /home/agnipau/.cargo/bin \
    /home/agnipau/.npm-packages/bin \
    $GOPATH/bin \
    /home/agnipau/.luarocks/bin \
    /home/agnipau/.pub-cache/bin \
    $ANDROID_HOME/tools \
    $ANDROID_HOME/tools/bin \
    $ANDROID_HOME/platform-tools \
    $ANDROID_HOME/emulator \
    /home/agnipau/.local/bin \
    $PATH

set -x FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
set -x FZF_DEFAULT_OPTS "
  --multi --inline-info --height 95%
  --color fg:8,hl:7,fg+:6,bg+:0,hl+:7
  --color info:0,prompt:6,spinner:6,pointer:6,marker:6
"


abbr uupd "yay --color=auto -Syyuv"
abbr uupda "yay --color=auto -Syyuv; rustup update; flutter upgrade --force --verbose; flutter config --no-analytics"
abbr upd "yay --color=auto -Syuv"
abbr autorem "yay --color=auto -R (yay -Qdtq)"
abbr installed "yay --color=auto -Qe"
abbr src "yay --color=auto -Ss"
abbr ins "yay -S --needed --noconfirm"
abbr pinfo "yay -Qi --color=auto"
abbr rpinfo "yay -Si --color=auto"
abbr rem "yay -R --noconfirm"
# abbr ssrc "nix-env -qaP"
# abbr src "nix search"
# abbr rem "sudo nix-env -e"
# abbr upd "sudo nix-channel --update"
# abbr uupd "sudo nixos-rebuild switch"
# abbr enix "sudo nvim /etc/nixos/configuration.nix"
# abbr nixs "nix-shell --run fish"
abbr reload ". $HOME/.config/fish/config.fish"
abbr ref "sudo reflector --verbose --sort rate --save /etc/pacman.d/mirrorlist"
abbr mkdir "mkdir -p"
abbr pygm "pygmentize -f png -O 'font_name=Input Mono Narrow,font_size=32' -o pygmentscreen.png script.py"
abbr ls "exa -lh -s type"
abbr la "exa -lah -s type"
abbr t "tmux -u"
abbr bon "bluetoothctl power on"
abbr dl "curl -LOC -"
abbr cpp "rsync -ah --progress"
abbr glog "git log --no-color"
abbr rm "trash --"
abbr q "exit"
abbr qq "exit"
abbr rml "trash-list"
abbr rmr "trash-restore"
abbr k "xset r rate 200 40; sudo localectl set-x11-keymap it pc105 us caps:ctrl_modifier"
abbr kg "gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 40; gsettings set org.gnome.desktop.peripherals.keyboard delay 200"
abbr airpods "bluetoothctl -- connect 7C:9A:1D:C1:32:5F"
abbr reboot "read -P 'Sei sicuro di volere riavviare? ' && systemctl reboot"
abbr poweroff "read -P 'Sei sicuro di volere spegnere? ' && systemctl poweroff"
abbr suspend "read -P 'Sei sicuro di volere sospendere? ' && systemctl suspend"
abbr bar "killall polybar; polybar main &disown"
abbr cpolybar "nvim ~/.config/polybar/config"
abbr spolybar "pkill polybar; polybar main &disown"
# TODO: si3
abbr ci3 "nvim ~/.config/i3/config"
abbr shc "shellcheck --enable=all"
abbr cfish "nvim ~/.config/fish/config.fish"
abbr sfish "source ~/.config/fish/config.fish"
abbr cbash "nvim ~/.bashrc"
abbr ctmux "nvim ~/.tmux.conf"
abbr stmux "tmux source-file ~/.tmux.conf"
abbr calacritty "nvim ~/.config/alacritty/alacritty.yml"
abbr lbar "lemon | lemonbar -g 2560x70 -b -B '#ff1d2021' -F '#ffebdbb2' -p -f 'Input Mono Narrow:size=13' -o -20 | sh"
abbr gs "git status"
abbr ga "git add ."
abbr gc "git commit -m \"\""
abbr gp "git push"
abbr mpv "devour-hide mpv"
abbr pcmanfm "devour-hide pcmanfm"
abbr sxiv "devour-hide sxiv"
abbr rcode "code"
abbr code "devour-hide code --verbose >/dev/null 2>&1"
abbr emacsd "emacs --daemon"
abbr emacsc "emacsclient -c &disown"
abbr emacsq "emacsclient -e '(kill-emacs)'"
abbr cardib "cargo b"

# Gruvbox dark
set color_grey = "928374"
set selection_color = "504945"

# # Anirak
# set color_grey = "757c87"
# set selection_color = "15194c"

set fish_color_normal white
set fish_color_command --bold white
set fish_color_quote blue
set fish_color_redirection cyan
set fish_color_end --bold black
set fish_color_error red
set fish_color_param white
set fish_color_comment --bold black
set fish_color_search_match --background=blue
set fish_color_operator --bold yellow
set fish_color_escape magenta
set fish_color_autosuggestion $color_grey
set fish_color_cancel --bold red
set fish_pager_color_completion $color_grey
set fish_pager_color_description $color_grey
set fish_pager_color_prefix --bold white

bass (ssh-agent -s) >/dev/null

# Start tmux automatically whenever a new terminal instance is opened
test -z $TMUX;
  and test -z $INSIDE_EMACS;
  and test $DISPLAY;
  and status --is-interactive;
  and tmux -u

# Start X automatically only if in tty1
test -z $DISPLAY;
    and test (tty) = /dev/tty1;
    and startx

