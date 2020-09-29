colorscheme gruvbox

# Window focus.
# ‾‾‾‾‾‾‾‾‾‾‾‾‾

set-face global CursorLine "default,%opt{gruvbox_bg1}"
addhl global/ line '%val{cursor_line}' CursorLine
set-face global InactiveCursor "default,%opt{gruvbox_bg4}"

hook global FocusIn .* %{
    set-face window CursorLine "default,%opt{gruvbox_bg1}"
    set-face window PrimaryCursor PrimaryCursor
    set-face window PrimaryCursorEol PrimaryCursorEol
    set-face window SecondaryCursor SecondaryCursor
    set-face window SecondaryCursorEol SecondaryCursorEol
    set-face window LineNumberCursor LineNumberCursor
    set-face window PrimarySelection PrimarySelection
    set-face window SecondarySelection SecondarySelection
}

hook global FocusOut .* %{
    set-face window CursorLine "default,%opt{gruvbox_bg0}"
    set-face window PrimaryCursor InactiveCursor
    set-face window PrimaryCursorEol InactiveCursor
    set-face window SecondaryCursor InactiveCursor
    set-face window SecondaryCursorEol InactiveCursor
    set-face window LineNumberCursor LineNumbers
    set-face window PrimarySelection InactiveCursor
    set-face window SecondarySelection InactiveCursor
}

# Appearance.
# ‾‾‾‾‾‾‾‾‾‾‾

hook global WinCreate ^[^*]+$ %{
    addhl window/ number-lines -relative -hlcursor -separator ' '
}
addhl global/ show-matching
# addhl global/ wrap -word -indent # -marker '↪ '
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
    set global fzf_preview_pos       'up'
}

def f %{
    require-module fzf
    fzf-mode
}

map global user f ': f<ret>'

# System clipboard handling.
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

def xsel-yank %{
    exec '<a-|>xsel -ib<ret>: echo -markup %{{Information}yanked selections to X11 clipboard}<ret>'
}

def xsel-replace %{
    exec '|xsel -ob<ret>'
}

map global user p     ': eval %sh{ kak-clipboard paste after }<ret>'     -docstring 'paste (after) from clipboard'
map global user P     ': eval %sh{ kak-clipboard paste before }<ret>'    -docstring 'paste (before) from clipboard'
map global user <a-p> ': eval %sh{ kak-clipboard paste after -s }<ret>'  -docstring 'paste (after and select) from clipboard'
map global user <a-P> ': eval %sh{ kak-clipboard paste before -s }<ret>' -docstring 'paste (before and select) from clipboard'
map global user y     ': xsel-yank<ret>'                                 -docstring 'yank to clipboard'
map global user R     ': xsel-replace<ret>'                              -docstring 'replace selection with clipboard'

# Highlight hidden characters.
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

def toggle-whitespaces -docstring 'toggle the visibility of whitespace characters' %{
    try %{
        addhl global/ show-whitespaces
    } catch %{
        rmhl global/show-whitespaces
    }
}

map global user 'h' ': toggle-whitespaces<ret>' -docstring 'toggle whitespaces'

# Sudo write.
# Taken from https://github.com/occivink/kakoune-sudo-write/blob/master/sudo-write.kak
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

def -hidden sudo-write-cached-password %{
    # The password was already cached, so we don't need any tricky handling.
    eval -save-regs f %{
        reg f %sh{ mktemp -t XXXXXX }
        write %reg{f}
        eval %sh{
            sudo -n -- dd if="${kak_main_reg_f}" of="${kak_buffile}" >/dev/null 2>&1
            if [ "$?" -eq 0 ]; then
                printf '%s' "edit!"
            else
                printf '%s' 'fail "Unknown failure"'
            fi
            rm -f "${kak_main_reg_f}"
        }
    }
}

def -hidden sudo-write-prompt-password %{
    prompt -password 'password:' %{
        eval -save-regs r %{
            eval -draft -save-regs 'tf|"' %{
                reg t %val{buffile}
                reg f %sh{ mktemp -t XXXXXX }
                write %reg{f}

                # Write the password in a buffer in order to pass it through STDIN to sudo
                # somewhat dangerous, but better than passing the password
                # through the shell scope's environment or interpolating it inside the shell string
                # 'exec |' is pretty much the only way to pass data over STDIN
                edit -scratch '*sudo-password-tmp*'
                reg '"' "%val{text}"
                exec <a-P>
                reg | %{
                    sudo -S -- dd if="${kak_main_reg_f}" of="${kak_main_reg_t}" >/dev/null 2>&1
                    if [ "$?" -eq 0 ]; then
                        printf '%s' 'edit!'
                    else
                        printf '%s' 'fail "Incorrect password?"'
                    fi
                    rm -f "${kak_main_reg_f}"
                }
                exec '|<ret>'
                exec -save-regs '' '%"ry'
                delete-buffer! '*sudo-password-tmp*'
            }
            eval %reg{r}
        }
    }
}

def ws -docstring 'write the content of the buffer using sudo' %{
    eval %sh{
        # Tricky posix-way of getting the first character of a variable.
        if [ "${kak_buffile%"${kak_buffile#?}"}" != "/" ]; then
            # Not entirely foolproof as a scratch buffer may start with '/',
            # but good enough.
            printf '%s' 'fail "Not a file"'
            exit
        fi

        # Check if the password is cached.
        if sudo -n true >/dev/null 2>&1; then
            printf sudo-write-cached-password
        else
            printf sudo-write-prompt-password
        fi
    }
}

# Autowrap.
# ‾‾‾‾‾‾‾‾‾

set global autowrap_column 80
set global autowrap_fmtcmd 'fmt -w %c'
set global autowrap_format_paragraph yes

hook global WinSetOption filetype=(asciidoc|markdown) %{
    autowrap-enable
    hook -once window WinSetOption filetype=(?!asciidoc)(?!markdown).* %{
        autowrap-disable
    }
}

def wrap %{
    eval %sh{
        case "${kak_opt_filetype}" in
            rust)
                head="$(printf '%s' "${kak_selection}" | tr -d '[:space:]' | head -c3)"
                case "${head}" in
                    '///')
                        printf '%s\n' "exec '|fmt -w ${kak_opt_autowrap_column} -p ''///''<ret>'"
                        ;;
                    '//'*)
                        printf '%s\n' "exec '|fmt -w ${kak_opt_autowrap_column} -p ''//''<ret>'"
                        ;;
                    *)
                        printf '%s\n' "exec '|fmt -w ${kak_opt_autowrap_column}<ret>'"
                        ;;
                esac
                ;;
            sh|python)
                printf '%s\n' "exec '|fmt -w ${kak_opt_autowrap_column} -p \"#\"<ret>'"
                ;;
            *)
                printf '%s\n' "exec '|fmt -w ${kak_opt_autowrap_column}<ret>'"
                ;;
        esac
    }
}

# Editor config integration.
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

hook global BufOpenFile .* %{ editorconfig-load }
hook global BufNewFile .* %{ editorconfig-load }

# Highlight the word under the cursor.
# Taken from mawww's dotfiles.
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

set-face global CurWord "default,%opt{gruvbox_bg2}"

hook global NormalIdle .* %{
    eval -draft %{
        try %{
            exec '<space><a-i>w <a-k>\A\w+\z<ret>'
            addhl -override global/curword regex "\b\Q%val{selection}\E\b" 0:CurWord
        } catch %{
            addhl -override global/curword group
        }
    }
}

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
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

hook global BufWritePre .* %{
    try %{
        eval %sh{
            case "${kak_opt_filetype}" in
            markdown) exit ;;
            *) printf '%s\n' "exec -draft '%s\h+$<ret>d'" ;;
            esac
        }
    }
}

# Align with spaces instead of tabs.
hook global WinCreate .* %{
    set window aligntab false
}

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

# Custom mappings.
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

# Leader.
# map global normal '<backspace>'   <space>   -docstring 'remove all selections except main'
# map global normal '<a-backspace>' <a-space> -docstring 'remove the main selection'
map global normal '<space>' ','         -docstring 'leader key'
map global normal ','       '<space>'   -docstring 'remove all selections except main'
map global normal '<a-,>'   '<a-space>' -docstring 'remove the main selection'

# Misc.
map global normal '#'       ': comment-line<ret>'       -docstring 'comment/uncomment selection (<a-c>)'
map global normal '='       ': wrap<ret>'               -docstring 'wrap text to fill %opt{autowrap_column}, similiar to `jq` in Vim'
map global user   'h'       ': toggle-whitespaces<ret>' -docstring 'toggle whitespaces'
map global user   '<space>' '/'                         -docstring 'search'

# Faster movements.
map global normal '<ret>'       '3j' # means <c-j>
map global normal '<c-k>'       '3k'
map global normal '<backspace>' 'gh' # means <c-h>
map global normal '<c-l>'       'gl'

hook global -always BufOpenFifo '\*grep\*' %{ map -- global normal - ': grep-next-match<ret>' }
hook global -always BufOpenFifo '\*make\*' %{ map -- global normal - ': make-next-error<ret>' }

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

# Surround commands.
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

def -hidden surround-inner %{
    eval %sh{
        wrapping_text="$(printf '%s' "${kak_text}" | kak-escape raw-insert | kak-escape double-string "'")"
        printf '%s\n' "exec -draft 'i${wrapping_text}<esc>a${wrapping_text}<esc>'"
    }
}

def surround -docstring 'surround selection with a string of an arbitrary length' %{
    prompt 'surround:' surround-inner
}

def surround-pair -docstring 'surround selection with a pair of chars' -params 1 %{
    eval %sh{
        case "$1" in
            '('|')')
                printf '%s\n' "exec -draft 'i(<esc>a)<esc>'"
                ;;
            '['|']')
                printf '%s\n' "exec -draft 'i[<esc>a]<esc>'"
                ;;
            '{'|'}')
                printf '%s\n' "exec -draft 'i{<esc>a}<esc>'"
                ;;
            '<'|'>')
                printf '%s\n' "exec -draft 'i<lt><esc>a<gt><esc>'"
                ;;
            '|'|'_'|'-')
                printf '%s\n' "exec -draft 'i$1<esc>a$1<esc>'"
                ;;
            "'")
                printf '%s\n' "exec -draft 'i''<esc>a''<esc>'"
                ;;
            '"')
                printf '%s\n' "exec -draft 'i\"<esc>a\"<esc>'"
                ;;
            '`')
                printf '%s\n' "exec -draft 'i\`<esc>a\`<esc>'"
                ;;
        esac
    }
}

declare-user-mode surround
map global user 's' ': enter-user-mode surround<ret>'
map global surround 's' ': surround<ret>'

declare-user-mode surround-pair
map global surround 'p' ': enter-user-mode surround-pair<ret>'
map global surround-pair '(' %{: surround-pair '('<ret>}
map global surround-pair ')' %{: surround-pair ')'<ret>}
map global surround-pair '[' %{: surround-pair '['<ret>}
map global surround-pair ']' %{: surround-pair ']'<ret>}
map global surround-pair '{' %[: surround-pair '{'<ret>]
map global surround-pair '}' %[: surround-pair '}'<ret>]
map global surround-pair '<' %{: surround-pair '<lt>'<ret>}
map global surround-pair '>' %{: surround-pair '<gt>'<ret>}
map global surround-pair '|' %{: surround-pair '|'<ret>}
map global surround-pair '_' %{: surround-pair '_'<ret>}
map -- global surround-pair '-' %{: surround-pair '-'<ret>}
map global surround-pair "'" %{: surround-pair "'"<ret>}
map global surround-pair '"' %{: surround-pair '"'<ret>}
map global surround-pair "`" %{: surround-pair "`"<ret>}

