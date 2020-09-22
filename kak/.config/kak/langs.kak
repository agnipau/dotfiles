hook global WinSetOption filetype=rust-custom %{
    set buffer formatcmd 'rustfmt'
    hook buffer BufWritePre .* %{format}
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

