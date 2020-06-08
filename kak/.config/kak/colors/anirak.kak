# Anirak theme
#
# Inspired by Anirak for VSCode: "https://marketplace.visualstudio.com/items?itemName=barjo.anirak"

# Color palette
declare-option str anirak_black 'rgb:0c0d10'
face global anirak_black %opt{anirak_black}
face global anirak_black_b "%opt{anirak_black}+b"
declare-option str anirak_white 'rgb:f0f8ff'
face global anirak_white %opt{anirak_white}
face global anirak_white_b "%opt{anirak_white}+b"
declare-option str anirak_blue 'rgb:599aff'
face global anirak_blue %opt{anirak_blue}
face global anirak_blue_b "%opt{anirak_blue}+b"
declare-option str anirak_blue_cursor 'rgb:2f3dfa'
face global anirak_blue_cursor %opt{anirak_blue_cursor}
face global anirak_blue_cursor_b "%opt{anirak_blue_cursor}+b"
declare-option str anirak_blue_selection 'rgb:15194c'
face global anirak_blue_selection %opt{anirak_blue_selection}
face global anirak_blue_selection_b "%opt{anirak_blue_selection}+b"
declare-option str anirak_blue_selection2 'rgb:233551'
face global anirak_blue_selection2 %opt{anirak_blue_selection2}
face global anirak_blue_selection2_b "%opt{anirak_blue_selection2}+b"
declare-option str anirak_cyan 'rgb:9ccdff'
face global anirak_cyan %opt{anirak_cyan}
face global anirak_cyan_b "%opt{anirak_cyan}+b"
declare-option str anirak_green 'rgb:17ff88'
face global anirak_green %opt{anirak_green}
face global anirak_green_b "%opt{anirak_green}+b"
declare-option str anirak_gray_cursor_line 'rgb:111217'
face global anirak_gray_cursor_line %opt{anirak_gray_cursor_line}
face global anirak_gray_cursor_line_b "%opt{anirak_gray_cursor_line}+b"
declare-option str anirak_gray 'rgb:41444c'
face global anirak_gray %opt{anirak_gray}
face global anirak_gray_b "%opt{anirak_gray}+b"
declare-option str anirak_gray_light2 'rgb:40444b'
face global anirak_gray_light2 %opt{anirak_gray_light2}
face global anirak_gray_light2_b "%opt{anirak_gray_light2}+b"
declare-option str anirak_gray_light 'rgb:757c87'
face global anirak_gray_light %opt{anirak_gray_light}
face global anirak_gray_light_b "%opt{anirak_gray_light}+b"
declare-option str anirak_menu_active_bg 'rgb:3a3d46'
face global anirak_menu_active_bg %opt{anirak_menu_active_bg}
face global anirak_menu_active_bg_b "%opt{anirak_menu_active_bg}+b"
declare-option str anirak_menu_inactive_bg 'rgb:21232b'
face global anirak_menu_inactive_bg %opt{anirak_menu_inactive_bg}
face global anirak_menu_inactive_bg_b "%opt{anirak_menu_inactive_bg}+b"
declare-option str anirak_error_bg 'rgb:241517'
face global anirak_error_bg %opt{anirak_error_bg}
face global anirak_error_bg_b "%opt{anirak_error_bg}+b"
declare-option str anirak_error_fg 'rgb:f86464'
face global anirak_error_fg %opt{anirak_error_fg}
face global anirak_error_fg_b "%opt{anirak_error_fg}+b"

face global value %opt{anirak_green}
face global type %opt{anirak_white}
face global variable %opt{anirak_white}
face global function "%opt{anirak_white}+b"
face global module %opt{anirak_white}
face global string %opt{anirak_blue}
face global error %opt{anirak_green}
face global keyword %opt{anirak_gray_light}
face global operator %opt{anirak_gray_light}
face global attribute %opt{anirak_gray_light}
face global comment %opt{anirak_gray}
face global meta %opt{anirak_white}
face global builtin %opt{anirak_gray_light}
face global delimiter %opt{anirak_gray_light}

face global title %opt{anirak_gray}
face global header %opt{anirak_gray}
face global mono %opt{anirak_gray}
face global block %opt{anirak_gray}
face global link %opt{anirak_blue}
face global bullet %opt{anirak_gray}
face global list %opt{anirak_gray}

add-highlighter global/ line '%val{cursor_line}' "default,%opt{anirak_gray_cursor_line}"

face global Default "%opt{anirak_white},%opt{anirak_black}"

face global PrimarySelection "default,%opt{anirak_blue_selection}"
face global PrimaryCursor "%opt{anirak_white},%opt{anirak_blue_cursor}"
face global PrimaryCursorEol "default,%opt{anirak_cyan}"

face global SecondarySelection "default,%opt{anirak_blue_selection2}"
face global SecondaryCursor "%opt{anirak_white},%opt{anirak_blue_cursor}"
face global SecondaryCursorEol "default,%opt{anirak_cyan}"

face global MatchingChar "default,%opt{anirak_gray}"
face global Search "%opt{anirak_blue},%opt{anirak_green}"
face global CurrentWord "%opt{anirak_white},%opt{anirak_blue}"

# listchars
face global Whitespace "%opt{anirak_gray},default+f"
# ~ lines at EOB
face global BufferPadding "%opt{anirak_black},%opt{anirak_black}"
# Color of the wrap marker
face global WrapMarker Whitespace

face global LineNumbers "%opt{anirak_gray},%opt{anirak_black}"
# must use -hlcursor
face global LineNumberCursor "%opt{anirak_white},default"
face global LineNumbersWrapped "%opt{anirak_gray},%opt{anirak_black}+i"

# When item focused in menu
face global MenuForeground "%opt{anirak_white},%opt{anirak_menu_active_bg}"
# Default bottom menu and autocomplete
face global MenuBackground "%opt{anirak_white},%opt{anirak_menu_inactive_bg}"
# Complement in autocomplete like path
face global MenuInfo default,default
# Clippy
face global Information "%opt{anirak_white},%opt{anirak_menu_inactive_bg}"
# Error messages
face global Error "%opt{anirak_error_fg},default"

# All status line: what we type, but also client@[session]
face global StatusLine "%opt{anirak_white},default"
# Insert mode, prompt mode
face global StatusLineMode "%opt{anirak_cyan},default+b"
# Message like '1 sel'
face global StatusLineInfo "%opt{anirak_white},default"
# Count
face global StatusLineValue "%opt{anirak_white},default"
# Cursor for command line
face global StatusCursor "%opt{anirak_white},%opt{anirak_blue_cursor}"
# Like the word 'select:' when pressing 's'
face global Prompt "%opt{anirak_white},default"

