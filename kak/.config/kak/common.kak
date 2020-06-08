set-option global tabstop 4
set-option global indentwidth 4

add-highlighter global/ number-lines -relative -hlcursor -separator '  '
add-highlighter global/ show-matching
add-highlighter global/ wrap -word -indent -marker '↪ '

define-command toggle-whitespaces -docstring 'toggle-whitespaces' %{
    try %{
        add-highlighter global/ show-whitespaces
    } catch %{
        remove-highlighter global/show-whitespaces
    }
}

set global ui_options ncurses_assistant=none
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

# Remove trailing spaces
hook global BufWritePre .* %{
    try %{
        exec -draft '%s\h+$<ret>d'
    }
}

# Align with spaces
hook global WinCreate .* %{
    set-option window aligntab false
}

# Editorconfig
hook global WinCreate ^[^*]+$ %{editorconfig-load}

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

