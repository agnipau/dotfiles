# LSP integration.
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

eval %sh{kak-lsp --kakoune -s "${kak_session}"}

def lsp-restart %{ lsp-stop; lsp-start }

# set-option global lsp_completion_trigger "execute-keys 'h<a-h><a-k>\S[^\s,=;*(){}\[\]]\z<ret>'"
set global lsp_diagnostic_line_error_sign   "!"
set global lsp_diagnostic_line_warning_sign "?"

# hook global WinSetOption filetype=(rust|python|dart|sh|typescript|javascript|html|css|json|go|c|cpp) %{
hook global WinSetOption filetype=(rust) %{
    map buffer user 'l' ': enter-user-mode lsp<ret>' -docstring 'LSP mode'
    map buffer lsp 'R' ': lsp-rename-prompt<ret>' -docstring 'rename symbol under cursor'
    lsp-enable-window
    hook -always global KakEnd .* lsp-exit
    # set window lsp_hover_anchor true
    face buffer DiagnosticError   "default+u"
    face buffer DiagnosticWarning "default+u"
    face buffer LineFlagErrors    "%opt{gruvbox_c9_red}"
}

# Language-specific configurations.
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

hook global WinSetOption filetype=rust %{
    set buffer formatcmd 'rustfmt'
    hook buffer BufWritePre .* %{format}
    set buffer lsp_server_configuration rust.clippy_preference="on"
}

hook global WinSetOption filetype=python %{
    set buffer formatcmd 'autopep8 -'
    hook buffer BufWritePre .* %{format}
}

hook global WinSetOption filetype=cpp %{
    set buffer formatcmd 'clang-format'
    hook buffer BufWritePre .* %{format}
}

hook global BufCreate '.*\.mk$' %{
    set buffer filetype makefile
}

hook global BufCreate '.*\.cs$' %{
    set buffer filetype csharp
}

hook global BufCreate '.*\.config/polybar/config$' %{
    set buffer filetype ini
}

