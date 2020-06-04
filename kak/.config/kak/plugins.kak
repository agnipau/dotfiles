# Bootstrap the plugin manager
evaluate-commands %sh{
    plugins="${HOME}/.config/kak/plugins"
    mkdir -p "${plugins}"
    [ ! -e "${plugins}/plug.kak" ] && \
        git clone -q https://gitlab.com/andreyorst/plug.kak.git "$plugins/plug.kak"
    printf '%s' "source '$plugins/plug.kak/rc/plug.kak'"
}

plug "andreyorst/plug.kak" domain gitlab.com noload config %{
    set-option global plug_always_ensure true
    set-option global plug_profile true
    hook global WinSetOption filetype=plug %{
        remove-highlighter buffer/numbers
        remove-highlighter buffer/matching
        remove-highlighter buffer/wrap
        remove-highlighter buffer/show-whitespaces
    }
}

plug "matgua/anirak.kak" theme config %{
    colorscheme anirak
    add-highlighter global/ column 80 "default,%opt{anirak_gray_cursor_line}"
}

plug "screwtapello/kakoune-inc-dec" domain gitlab.com config %{
    map -docstring "decrement selection" global normal '<C-w>' ': inc-dec-modify-numbers - %val{count}<ret>'
    map -docstring "increment selection" global normal '<C-a>' ': inc-dec-modify-numbers + %val{count}<ret>'
}

plug "alexherbo2/auto-pairs.kak" %{
    hook global WinCreate .* auto-pairs-enable
}

plug "occivink/kakoune-sudo-write"

