eval %sh{kak-lsp --kakoune -s $kak_session}
hook global WinSetOption filetype=(rust|python) %{
    lsp-enable-window
    map window user "l" ": enter-user-mode lsp<ret>" -docstring "LSP mode"
    map window lsp "n" "<esc>: lsp-find-error --include-warnings<ret>" -docstring "find next error or warning"
    map window lsp "p" "<esc>: lsp-find-error --previous --include-warnings<ret>" -docstring "find previous error or warning"
    hook -always global KakEnd .* lsp-exit
    lsp-auto-hover-enable
    lsp-auto-hover-insert-mode-disable
    set-option window lsp_hover_anchor true
    set-face window DiagnosticError default+u
    set-face window DiagnosticWarning default+u
}
hook global WinSetOption filetype=rust %{
    set-option window lsp_server_configuration rust.clippy_preference="on"
}
define-command lsp-restart %{
    lsp-stop
    lsp-start
}
set-option global lsp_diagnostic_line_error_sign "!"
set-option global lsp_diagnostic_line_warning_sign "?"
set-option global lsp_completion_trigger "execute-keys 'h<a-h><a-k>\S[^\s,=;*(){}\[\]]\z<ret>'"

# Rust
hook global WinSetOption filetype=rust %{
    set-option buffer formatcmd 'rustfmt'
    hook buffer BufWritePre .* %{format}
    add-highlighter shared/rust/code/my_delimiter regex (?:\(|\)|->|\[|\]|\{|\}|::|\;|,|&|\.|<|>|=>|\|) 0:delimiter
    add-highlighter shared/rust/code/my_keyword regex (?:enum|impl|const)\s 0:anirak_cyan
    add-highlighter shared/rust/code/my_self regex self 0:anirak_white
}

hook global WinSetOption filetype=python %{
    set-option buffer formatcmd 'autopep8 -'
    hook buffer BufWritePre .* %{format}
    add-highlighter shared/python/code/my_import regex (?:import|from)\s 0:anirak_cyan_b
    # TODO: Non va
    add-highlighter shared/python/code/my_todo regex '\#\s*[A-Z]+:' 0:anirak_green_b
}

hook global WinSetOption filetype=cpp %{
    set-option buffer formatcmd 'clang-format'
    hook buffer BufWritePre .* %{format}
}

# Makefile
hook global BufCreate .*\.mk$ %{
    set-option buffer filetype makefile
}

