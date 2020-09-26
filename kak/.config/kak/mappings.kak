# Leader.
# map global normal '<backspace>'   <space>   -docstring 'remove all selections except main'
# map global normal '<a-backspace>' <a-space> -docstring 'remove the main selection'
map global normal '<space>' ','         -docstring 'leader key'
map global normal ','       '<space>'   -docstring 'remove all selections except main'
map global normal '<a-,>'   '<a-space>' -docstring 'remove the main selection'

# Misc.
map global normal '<a-c>'   ': comment-line<ret>'                   -docstring 'comment/uncomment selection (<a-c>)'
map global normal '='       '|fmt -w $kak_opt_autowrap_column<ret>' -docstring 'wrap text to fill %opt{autowrap_column}, similiar to `jq` in Vim'
map global user   'h'       ': toggle-whitespaces<ret>'             -docstring 'toggle whitespaces'
map global user   '<space>' '/'                                     -docstring 'search'

# Faster movements.
map global normal '<ret>'       '3j' # means <c-j>
map global normal '<c-k>'       '3k'
map global normal '<backspace>' 'gh' # means <c-h>
map global normal '<c-l>'       'gl'

# System clipboard integration.
map global normal 'y'     ': xsel-copy<ret>'               -docstring "copy to system clipboard"
map global normal 'd'     ': xsel-copy<ret>d'              -docstring "cut to system clipboard"
map global normal 'c'     ': xsel-copy<ret>c'              -docstring "cut to system clipboard, enter insert mode"
map global normal 'P'     ': xsel-paste before false<ret>' -docstring "paste from system clipboard before cursor"
map global normal 'p'     ': xsel-paste after false<ret>'  -docstring "paste from system clipboard after cursor"
map global normal '<a-P>' ': xsel-paste before true<ret>'  -docstring "paste and select from system clipboard before cursor"
map global normal '<a-p>' ': xsel-paste after true<ret>'   -docstring "paste and select from system clipboard after cursor"
map global normal 'R'     '|xsel -ob<ret>'                 -docstring "replace selection with the text in the system clipboard"
map global user   'y'     'y'     -docstring "copy to clipboard"
map global user   'd'     'd'     -docstring "cut to clipboard"
map global user   'c'     'c'     -docstring "cut to clipboard, enter insert mode"
map global user   'P'     'P'     -docstring "paste from clipboard before cursor"
map global user   'p'     'p'     -docstring "paste from clipboard after cursor"
map global user   '<a-P>' '<a-P>' -docstring "paste and select from clipboard before cursor"
map global user   '<a-p>' '<a-P>' -docstring "paste and select from clipboard after cursor"
map global user   'R'     'R'     -docstring "replace selection with the text in the clipboard"

# Window management.
declare-user-mode wm
map global user 'w' ': enter-user-mode wm<ret>'
map global wm 'l' ': new<ret>'
map global wm 'j' ': tmux-terminal-vertical kak -c %val{session}<ret>'

# Disable arrows, they're useless.
map global normal '<left>'    ''
map global normal '<right>'   ''
map global normal '<up>'      ''
map global normal '<down>'    ''
map global normal '<s-left>'  ''
map global normal '<s-right>' ''
map global normal '<s-up>'    ''
map global normal '<s-down>'  ''
map global insert '<left>'    ''
map global insert '<right>'   ''
map global insert '<up>'      ''
map global insert '<down>'    ''
map global insert '<s-left>'  ''
map global insert '<s-right>' ''
map global insert '<s-up>'    ''
map global insert '<s-down>'  ''

# FZF.
map global normal <c-p> ': fzf-mode<ret>'

