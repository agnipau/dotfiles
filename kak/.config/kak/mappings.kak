# Leader
map global normal <space> , -docstring 'leader'
map global normal <backspace> <space> -docstring 'remove all sels except main'
map global normal <a-backspace> <a-space> -docstring 'remove main sel'

# User mappings
map global user "w" ": toggle-whitespaces<ret>" -docstring "toggle whitespaces"

# Normal mappings
map global normal '' ": comment-line<ret>" -docstring "comment/uncomment selection (<c-/>)"

# Tab and shift-tab for menu completion
hook global InsertCompletionShow .* %{
    try %{
        execute-keys -draft 'h<a-K>\h<ret>'
        map window insert <tab> <c-n>
        map window insert <s-tab> <c-p>
    }
}
hook global InsertCompletionHide .* %{
    unmap window insert <tab> <c-n>
    unmap window insert <s-tab> <c-p>
}

# System clipboard
map global user 'y' '<a-|>xsel -b -i<ret>:<space>echo -markup %{{Information}yanked selection to system clipboard}<ret>' -docstring "copy to system clipboard"
map global user 'd' '|xsel -b -i<ret>' -docstring "cut to system clipboard"
map global user 'c' '|xsel -b -i<ret>i' -docstring "cut to system clipboard, enter insert mode"
map global user 'P' '!xsel -o -b<ret>' -docstring "paste from system clipboard before cursor"
map global user 'p' '<a-!>xsel -o -b<ret>' -docstring "paste from system clipboard after cursor"
map global user 'R' '|xsel -o -b<ret>' -docstring "replace selection with system clipboard"

# Disable arrows
map global normal '<left>' ': nop<ret>'
map global normal '<right>' ': nop<ret>'
map global normal '<up>' ': nop<ret>'
map global normal '<down>' ': nop<ret>'
map global normal '<s-left>' ': nop<ret>'
map global normal '<s-right>' ': nop<ret>'
map global normal '<s-up>' ': nop<ret>'
map global normal '<s-down>' ': nop<ret>'
map global insert '<left>' 'z<backspace>'
map global insert '<right>' 'z<backspace>'
map global insert '<up>' 'z<backspace>'
map global insert '<down>' 'z<backspace>'
map global insert '<s-left>' 'z<backspace>'
map global insert '<s-right>' 'z<backspace>'
map global insert '<s-up>' 'z<backspace>'
map global insert '<s-down>' 'z<backspace>'

