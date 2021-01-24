hook global BufCreate (.*/)?PKGBUILD %{
    set-option buffer filetype sh
}
