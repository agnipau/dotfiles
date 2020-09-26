# Appearance.
# ‾‾‾‾‾‾‾‾‾‾‾

colorscheme gruvbox

addhl global/ number-lines -relative -hlcursor -separator ' '
addhl global/ show-matching
addhl global/ wrap -word -indent # -marker '↪ '
addhl global/ line '%val{cursor_line}' "default,%opt{gruvbox_bg1}"
addhl global/ column 80 "default,%opt{gruvbox_bg1}"

set global ui_options ncurses_assistant=none ncurses_status_on_top=true

# General settings.
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

set global tabstop 4
set global indentwidth 4
set global modelinefmt '%val{bufname} {{mode_info}} - %val{client}@[%val{session}]'
set global grepcmd 'rg -L --hidden --with-filename --column'
set global autoreload yes

# FZF.
# ‾‾‾‾

source "%val{config}/plugins/fzf.kak/rc/fzf.kak"
source "%val{config}/plugins/fzf.kak/rc/modules/fzf-file.kak"
source "%val{config}/plugins/fzf.kak/rc/modules/fzf-buffer.kak"
source "%val{config}/plugins/fzf.kak/rc/modules/fzf-search.kak"
source "%val{config}/plugins/fzf.kak/rc/modules/fzf-cd.kak"

hook -once global ModuleLoaded fzf %{
    set global fzf_highlight_command 'bat'
    set global fzf_file_command      'fd --type f --follow'
    set global fzf_cd_command        'fd --type d --follow'
    set global fzf_default_opts      '--multi --inline-info --height 95% --color fg:8,hl:7,fg+:6,bg+:0,hl+:7 --color info:0,prompt:6,spinner:6,pointer:6,marker:6'
    set global fzf_preview_pos up
}

def f %{
    require-module fzf
    fzf-mode
}

map global user f ': f<ret>'

# Autowrap.
# ‾‾‾‾‾‾‾‾‾

set global autowrap_column 80
set global autowrap_fmtcmd 'fold -s -w %c'
set global autowrap_format_paragraph yes

hook global WinSetOption filetype=(asciidoc|markdown) %{
    autowrap-enable
    hook -once window WinSetOption filetype=(?!asciidoc)(?!markdown).* %{
        autowrap-disable
    }
}

# Hooks.
# ‾‾‾‾‾‾

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
            # Throw if the buffer has something other than newlines in the beginning of lines.
            exec -buffer *scratch* '%s\A\n\z<ret>'
            delete-buffer *scratch*
        }
    }
}

# Highlight TODO, FIXME and other annotations.
# TODO: Foreground color doesn't work in comments.
addhl -override global/ regex \b((?:TODO|FIXME|HACK|NOTE):)\s "1:+rb"

# Diff.
# ‾‾‾‾‾

hook -group diff-text-objects global WinSetOption filetype=diff %{
    map window -docstring 'diff file' object f '<a-;> diff-select-file<ret>'
    map window -docstring 'diff hunk' object h '<a-;> diff-select-hunk<ret>'
    hook -once -always window WinSetOption filetype=.* %{
        unmap window object f
        unmap window object h
    }
}

addhl shared/diff/comment regex '^#[^\n]*' 0:comment
addhl shared/diff/feedback regex '^>[^\n]*' 0:title

def rm %{
    nop %sh{ rm -f "${kak_buffile}" }
    delete-buffer!
}

