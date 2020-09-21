hook global WinSetOption filetype=rust-custom %{
    set buffer formatcmd 'rustfmt'
    hook buffer BufWritePre .* %{format}
    # addhl shared/rust/code/my_delimiter regex (?:\(|\)|->|\[|\]|\{|\}|::|\;|,|&|\.|<|>|=>|\|) 0:delimiter
    # addhl shared/rust/code/my_keyword regex (?:enum|impl|const)\s 0:anirak_cyan
    # addhl shared/rust/code/my_self regex self 0:anirak_white
}

hook global WinSetOption filetype=python %{
    set buffer formatcmd 'autopep8 -'
    hook buffer BufWritePre .* %{format}
    # addhl shared/python/code/my_import regex (?:import|from)\s 0:anirak_cyan_b
    # TODO: Non va
    # addhl shared/python/code/my_todo regex '\#\s*[A-Z]+:' 0:anirak_green_b
}

hook global WinSetOption filetype=cpp %{
    set buffer formatcmd 'clang-format'
    hook buffer BufWritePre .* %{format}
}

hook global BufCreate .*\.mk$ %{
    set buffer filetype makefile
}

