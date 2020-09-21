# Bootstrap the plugin manager
evaluate-commands %sh{
    plugins="${HOME}/.config/kak/plugins"
    mkdir -p "${plugins}"
    [ ! -e "${plugins}/plug.kak" ] && \
        git clone -q https://github.com/robertmeta/plug.kak.git "$plugins/plug.kak"
    printf '%s' "source '$plugins/plug.kak/rc/plug.kak'"
}

plug "robertmeta/plug.kak" domain github.com noload config %{
    set-option global plug_always_ensure true
    set-option global plug_profile true
    hook global WinSetOption filetype=plug %{
        remove-highlighter buffer/numbers
        remove-highlighter buffer/matching
        remove-highlighter buffer/wrap
        remove-highlighter buffer/show-whitespaces
    }
}

plug "ul/kak-lsp" do %{
    cargo install --force --path . --locked
    cargo clean
} config %{
    define-command lsp-restart %{ lsp-stop; lsp-start }
    set-option global lsp_completion_trigger "execute-keys 'h<a-h><a-k>\S[^\s,=;*(){}\[\]]\z<ret>'"
    set-option global lsp_diagnostic_line_error_sign "!"
    set-option global lsp_diagnostic_line_warning_sign "?"
    hook global WinSetOption filetype=(rust|python|dart|sh|typescript|javascript|html|css|json|go|c|cpp) %{
        map window user "l" ": enter-user-mode lsp<ret>" -docstring "LSP mode"
        map window lsp "n" "<esc>: lsp-find-error --include-warnings<ret>" -docstring "find next error or warning"
        map window lsp "p" "<esc>: lsp-find-error --previous --include-warnings<ret>" -docstring "find previous error or warning"
        lsp-enable-window
        hook -always global KakEnd .* lsp-exit
        set-option window lsp_hover_anchor true
        set-face window DiagnosticError default+u
        set-face window DiagnosticWarning default+u
    }
    hook global WinSetOption filetype=rust %{
        set-option window lsp_server_configuration rust.clippy_preference="on"
    }
}

# plug "agnipau/anirak.kak" theme config %{
#     colorscheme anirak
#     add-highlighter global/ column 80 "default,%opt{anirak_gray_cursor_line}"
# }

plug "screwtapello/kakoune-inc-dec" domain gitlab.com config %{
    map -docstring "decrement selection" global normal '<C-w>' ': inc-dec-modify-numbers - %val{count}<ret>'
    map -docstring "increment selection" global normal '<C-a>' ': inc-dec-modify-numbers + %val{count}<ret>'
}

plug "alexherbo2/auto-pairs.kak" %{
    hook global WinCreate .* auto-pairs-enable
}

plug "occivink/kakoune-sudo-write"

plug "atomrc/kakoune-typescript"

