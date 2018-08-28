# Workaround for using italic in zsh prompt.
local lc=$'\e[' rc=m
typeset -AHg fg_italic fg_no_italic
for k in ${(k)color[(I)fg-*]}; do
  fg_italic[${k#fg-}]="$lc${color[standout]};${color[$k]}$rc"
  fg_no_italic[${k#fg-}]="$lc${color[normal]};${color[$k]}$rc"
done

# Highlight the :: in a different color when the command returns an exit code
# other than 0.
local ret_status="%(?_%{$fg_bold[white]%}::%{$reset_color%}_%{$fg_bold[red]%}::%{$reset_color%})"

PROMPT='%{$fg_bold[red]%}%n %{$fg_italic[cyan]%}%~%{$reset_color%} $(git_prompt_info)${ret_status} '

# Options for $(git_prompt_info).
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[red]%}on  "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[cyan]%} 🗙 "
ZSH_THEME_GIT_PROMPT_CLEAN=""
