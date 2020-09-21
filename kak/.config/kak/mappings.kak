# Leader.
map global normal '<space>' , -docstring 'leader key'
map global normal '<backspace>' <space> -docstring 'remove all selections except main'
map global normal '<a-backspace>' <a-space> -docstring 'remove the main selection'

# Misc.
map global normal '<a-c>' ': comment-line<ret>' -docstring 'comment/uncomment selection (<a-c>)'
map global normal '=' '|fmt -w $kak_opt_autowrap_column<ret>' -docstring 'wrap text to fill %opt{autowrap_column}, similiar to `jq` in Vim'
map global user 'w' ': toggle-whitespaces<ret>' -docstring 'toggle whitespaces'
map global user '<space>' '/' -docstring 'search'

# Faster movements.
map global normal '<ret>' '3j' # means <c-j>
map global normal '<c-k>' '3k'
# map global normal '<backspace>' 'gh' # means <c-h>
# map global normal '<c-l>' 'gl'

# System clipboard integration.
map global normal 'y' ': xsel-copy<ret>' -docstring "copy to system clipboard"
map global normal 'd' ': xsel-copy<ret>d' -docstring "cut to system clipboard"
map global normal 'c' ': xsel-copy<ret>c' -docstring "cut to system clipboard, enter insert mode"
map global normal 'P' ': xsel-paste before false<ret>' -docstring "paste from system clipboard before cursor"
map global normal 'p' ': xsel-paste after false<ret>' -docstring "paste from system clipboard after cursor"
map global normal '<a-P>' ': xsel-paste before true<ret>' -docstring "paste and select from system clipboard before cursor"
map global normal '<a-p>' ': xsel-paste after true<ret>' -docstring "paste and select from system clipboard after cursor"
map global normal 'R' '|xsel -ob<ret>' -docstring "replace selection with the text in the system clipboard"
map global user 'y' 'y' -docstring "copy to clipboard"
map global user 'd' 'd' -docstring "cut to clipboard"
map global user 'c' 'c' -docstring "cut to clipboard, enter insert mode"
map global user 'P' 'P' -docstring "paste from clipboard before cursor"
map global user 'p' 'p' -docstring "paste from clipboard after cursor"
map global user '<a-P>' '<a-P>' -docstring "paste and select from clipboard before cursor"
map global user '<a-p>' '<a-P>' -docstring "paste and select from clipboard after cursor"
map global user 'R' 'R' -docstring "replace selection with the text in the clipboard"

# Disable arrows, they're useless.
map global normal '<left>' ': nop<ret>'
map global normal '<right>' ': nop<ret>'
map global normal '<up>' ': nop<ret>'
map global normal '<down>' ': nop<ret>'
map global normal '<s-left>' ': nop<ret>'
map global normal '<s-right>' ': nop<ret>'
map global normal '<s-up>' ': nop<ret>'
map global normal '<s-down>' ': nop<ret>'
map global insert '<left>' 'a<backspace>'
map global insert '<right>' 'a<backspace>'
map global insert '<up>' 'a<backspace>'
map global insert '<down>' 'a<backspace>'
map global insert '<s-left>' 'a<backspace>'
map global insert '<s-right>' 'a<backspace>'
map global insert '<s-up>' 'a<backspace>'
map global insert '<s-down>' 'a<backspace>'

