# ilgiusto.zsh-theme
#
# A simple theme for zsh inspired by the Pure theme.
# This version is better in my opinion because it recognize in what line buffer
# you are and doesn't output a blank line before the prompt even when you are
# in line 1. This preserve the terminal aspect ratios.

# Workaround for using italic in the zsh prompt.
local lc=$'\e[' rc=m
typeset -AHg fg_italic fg_no_italic
for k in ${(k)color[(I)fg-*]}; do
  fg_italic[${k#fg-}]="$lc${color[standout]};${color[$k]}$rc"
  fg_no_italic[${k#fg-}]="$lc${color[normal]};${color[$k]}$rc"
done

# New line, current directory and git infos when in a git repo.
precmd() {
  # Get the current line number.
  setopt prompt_subst
  echo -ne "\033[6n" > /dev/tty
  read -t 1 -s -d 'R' cline < /dev/tty
  cline="${cline##*\[}"
  cline="${cline%;*}"

  if [[ "$cline" -eq 1 ]]; then
    print -rP "%{$fg_bold[cyan]%}%{$fg_italic[cyan]%}${PWD/$HOME/~}%{$reset_color%}%{$fg_bold[red]%}$(git_prompt_info)%{$reset_color%}"
  else
    print
    print -rP "%{$fg_bold[cyan]%}%{$fg_italic[cyan]%}${PWD/$HOME/~}%{$reset_color%}%{$fg_bold[red]%}$(git_prompt_info)%{$reset_color%}"
  fi
}

# When the command fails, the color of these two dots changes from white to red.
PROMPT="%(?_%{$fg_bold[white]%}:: %{$reset_color%}_%{$fg_bold[red]%}:: %{$reset_color%})"

# Options for $(git_prompt_info).
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[red]%} on  "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[cyan]%} ✘"
ZSH_THEME_GIT_PROMPT_CLEAN=""
