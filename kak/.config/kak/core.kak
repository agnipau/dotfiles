set global tabstop 4
set global indentwidth 4

colorscheme anirak

# addhl global/ number-lines -relative -hlcursor -separator ' '
addhl global/ show-matching
addhl global/ wrap -word -indent -marker '↪ '

def toggle-whitespaces -docstring 'toggle the visibility of whitespace characters' %{
    try %{
        addhl global/ show-whitespaces
    } catch %{
        rmhl global/show-whitespaces
    }
}

set global ui_options ncurses_assistant=none
# set global modelinefmt '%val{bufname} {{mode_info}} - %val{client}@[%val{session}]'
set global grepcmd 'rg -L --hidden --with-filename --column'

# Insert spaces when tab is pressed.
hook global InsertChar '\t' %{
    exec -draft "h%opt{indentwidth}@"
}
# Delete %opt{softtabstop} number of spaces with a single keypress if possible.
hook global InsertDelete ' ' %{
    try %{
        exec -itersel -draft "<a-h><a-k>^\h+.\z<ret>I<space><esc><lt>"
    } catch %{
        try %{
            exec -itersel -draft "h%opt{softtabstop}<s-h>2<s-l>s\h+\z<ret>d"
        }
    }
}

# Remove trailing spaces before saving.
hook global BufWritePre .* %{
    try %{
        exec -draft '%s\h+$<ret>d'
    }
}

# Align with spaces instead of tabs.
hook global WinCreate .* %{
    set window aligntab false
}

# Editorconfig integration.
hook global WinCreate ^[^*].+[^*]$ %{editorconfig-load}

# Delete the `*scratch*' buffer as soon as another is created, but only if it's empty.
hook global BufCreate '^\*scratch\*$' %{
    exec -buffer *scratch* '%d'
    hook -once -always global BufCreate '^(?!\*scratch\*).*$' %{
        try %{
            # Throw if the buffer has something other than newlines in the beginning of lines
            exec -buffer *scratch* '%s\A\n\z<ret>'
            delete-buffer *scratch*
        }
    }
}

