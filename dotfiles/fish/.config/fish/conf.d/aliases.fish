#!/usr/bin/env fish
#
# List of aliases sourced by fish before config.fish.

# Misc. aliases.
alias ydb      'cd $HOME/progetti/ydb; and ./ydb'
alias obapp    'obxprop | grep ^_OB_APP_'
alias app      'xprop | grep ^WM_'
alias nodebug  'notify-send "Debug" "Debug message"'
alias cnodebug 'notify-send -h string:fgcolor:"$color1" "Debug" "Debug message"'
alias grad     '. $HOME/.zshrc; hsetroot -add "$color1" -add "$color2" -gradient 0'
alias solid    '. $HOME/.zshrc; hsetroot -solid "$color1"'
alias discord  'beautifuldiscord --css "$HOME/.cache/wal-discord/style.css"'
alias down     'curl -fsSLO'
alias sdown    'curl -fSLO#'
alias sudo     'sudo -p (tput bold; tput setaf 1; printf ">> "; tput sgr0)'
alias ore      'date +%H:%M:%S'
alias data     'date "+%d %B %Y"'

# Short aliases.
alias t   'python $HOME/altri_progetti/t/t.py --task-dir $HOME/todo --list todo'
alias m   'alsamixer'
alias c   'clear'
alias q   'exit'
alias p   'ping google.com'
alias g   'gcc a.c'
alias a   './a.out'
alias n   'nvim a.c'
alias wp  'while true; sleep 1s; ping -c 3 google.com; and break; end'
alias pd  'pdflatex *.tex'
alias ist 'cd $HOME/srcs/st; and sudo make clean install; and exit'
alias rma 'rm -rf ./*'
alias lp  '~/bin/arch-list-pkgs; ~/bin/aur-list-pkgs'
alias wi  'sudo wifi-menu'
alias sp  'curl -o /dev/null http://test.kpnqwest.it/file2000.bin'
alias rg  'rg --smart-case'

# Git aliases.
alias ga   'git add .'
alias gm   'git commit -m'
alias gps  'git push'
alias gpl  'git pull'
alias gpla 'cd "$HOME/progetti"; for i in *; echo "$i"; cd "$i"; git pull; cd ..; end'
alias gs   'git status'
alias gsa  'cd "$HOME/progetti"; for i in *; echo "$i"; cd "$i"; git status; cd ..; end'
alias gr   'git remote -v'
alias gl   'git log'
alias lg   'lazygit'

# Make programs human readable/faster to type.
alias r     'ranger'
alias ls    'ls --group-directories-first --color=auto'
alias l     "ls"
alias l.    "ls -A | egrep '^\\.'"
alias la    'ls -A'
alias ll    'ls -Alh'
alias df    'df -h'
alias du    'du -h'
alias ll    'ls -Alh'
alias mkdir 'mkdir -p'
alias pqiv  'pqiv -i --box-colors="$color7":"$color0_lighter_90" --bind-key="@MONTAGE { h { montage_mode_shift_x(-1) } }" --bind-key="@MONTAGE { j { montage_mode_shift_y(1) } }" --bind-key "@MONTAGE { k { montage_mode_shift_y(-1) } }" --bind-key "@MONTAGE { l { montage_mode_shift_x(1) } }" --bind-key="j { goto_file_relative(-1) }" --bind-key="k { goto_file_relative(1) }" --bind-key="h { goto_file_relative(-1) }" --bind-key="l { goto_file_relative(1) }" --bind-key="d { command(rm $1) }"'
alias neo   'clear; neofetch'

# Aliases for editing configuration files.
alias ebash 'nvim "$HOME/.bashrc"'
alias ezsh  'nvim "$HOME/.zshrc"'
alias efish 'nvim "$HOME/.config/fish/config.fish"'
alias elias 'nvim "$HOME/.config/fish/conf.d/aliases.fish"'
alias ebind 'nvim "$HOME/.config/fish/functions/fish_user_key_bindings.fish"'
alias envim 'nvim "$HOME/.config/nvim/init.vim"'
alias rnvim 'nvim README*; or nvim readme*'
alias tnvim 'nvim *.tex'
alias exres 'nvim "$HOME/.Xresources"'
alias ebox  'nvim "$HOME/.config/openbox/rc.xml"'
alias emenu 'nvim "$HOME/.config/openbox/menu.xml"'
alias emux  'nvim "$HOME/.tmux.conf"'
alias ebar  'nvim "$HOME/.config/polybar/config"'

# Aliases for sourcing configuration files.
alias ifish '. "$HOME/.config/fish/config.fish"'
alias ixres 'xrdb "$HOME/.Xresources"'
alias ibox  'openbox --reconfigure'
alias imux  'tmux source-file "$HOME/.tmux.conf"'
alias ibar  '"$HOME/bin/polyop"'

# Aliases for fixing typos.
alias dc   'cd'
alias sl   'ls'
alias nivm 'nvim'
alias cd.. 'cd ..'

# Grep aliases.
alias grep  'grep --color=auto'
alias egrep 'egrep --color=auto'
alias fgrep 'fgrep --color=auto'

# System aliases.
if test "$PREFIX"
  # Termux aliases.
  alias upd     'pkg update'
  alias upg     'pkg upgrade'
  alias ins     'pkg install'
  alias rem     'pkg remove'
  alias autorem 'apt autoremove'
  alias src     'pkg search'
else
  # Arch Linux aliases.
  alias pacman  'pacman --color auto'
  alias yay     'yay --color always'
  alias upd     'sudo pacman -Syu --noconfirm --color auto'
  alias aupd    'yay -Syu --noconfirm'
  alias ins     'sudo pacman -S --needed --noconfirm --color auto'
  alias ains    'yay -S --needed --noconfirm'
  alias rem     'sudo pacman -Rsu --noconfirm --color auto'
  alias srem    'sudo pacman -Rsnu --noconfirm --color auto'
  alias arem    'yay -Rsu --noconfirm'
  alias autorem 'sudo pacman -Rsu (pacman -Qdtq) --color auto'
  alias src     'pacman -Ss'
  alias asrc    'yay -Ss'
  alias info    'pacman -Qi'
end

# System management aliases.
alias po 'poweroff'
alias re 'reboot'

# More elaborated aliases.
function clone
  git clone --depth 1 https://github.com/$argv[1].git
end

function cclone
  git clone --depth 1 $argv[1].git
end
