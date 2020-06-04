set-option global tabstop 4
set-option global indentwidth 4

add-highlighter global/ number-lines -relative -hlcursor -separator '  '
add-highlighter global/ show-matching
add-highlighter global/ wrap -word -indent -marker '↪ '
# add-highlighter global/ show-whitespaces

set global modelinefmt '%val{bufname} {{mode_info}} - %val{client}@[%val{session}]'

# Grep
evaluate-commands %sh{
    if [ -n "$(command -v rg)" ]; then
        printf '%s' \
            'set-option global grepcmd "rg -L --hidden --with-filename --column"'
    fi
}
                                                                          
# Insert spaces when tab is pressed
hook global InsertChar '\t' %{
    execute-keys -draft "h%opt{indentwidth}@"
}
hook global InsertDelete ' ' %{
    try %sh{
        printf "%s" 'execute-keys -draft -itersel "<a-h><a-k>^\h+.\z<ret>I<space><esc><lt>"'
    } catch %{
        try %{
            execute-keys -itersel -draft "h%opt{softtabstop}<s-h>2<s-l>s\h+\z<ret>d"
        }
    }
}

# Align with spaces
hook global WinCreate .* %{
    set-option window aligntab false
}

# Editorconfig
hook global WinCreate ^[^*]+$ %{editorconfig-load}

# Tab and shift-tab for menu completion
hook global InsertCompletionShow .* %{
    try %{
        # this command temporarily removes cursors preceded by whitespace;
        # if there are no cursors left, it raises an error, does not
        # continue to execute the mapping commands, and the error is eaten
        # by the `try` command so no warning appears.
        execute-keys -draft 'h<a-K>\h<ret>'
        map window insert <tab> <c-n>
        map window insert <s-tab> <c-p>
    }
}
hook global InsertCompletionHide .* %{
    unmap window insert <tab> <c-n>
    unmap window insert <s-tab> <c-p>
}

# Delete the `*scratch*' buffer as soon as another is created, but only if it's empty
hook global BufCreate '^\*scratch\*$' %{
    execute-keys -buffer *scratch* '%d'
    hook -once -always global BufCreate '^(?!\*scratch\*).*$' %{
        try %{
            # Throw if the buffer has something other than newlines in the beginning of lines
            execute-keys -buffer *scratch* '%s\A\n\z<ret>'
            delete-buffer *scratch*
        }
    }
}

# Copy system clipboard
hook global NormalKey y|d|c %{
    nop %sh{
      printf '%s' "$kak_main_reg_dquote" | xsel  --input --clipboard
    }
}
# Paste system clipboard
map global user P '!xsel --output --clipboard<ret>'
map global user p '<a-!>xsel --output --clipboard<ret>'

