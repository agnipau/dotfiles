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
    # add-highlighter shared/python/code/my_todo regex '\#\s*[A-Z]+:' 0:anirak_green_b
}

hook global WinSetOption filetype=cpp %{
    set-option buffer formatcmd 'clang-format'
    hook buffer BufWritePre .* %{format}
}

# Makefile
hook global BufCreate .*\.mk$ %{
    set-option buffer filetype makefile
}

