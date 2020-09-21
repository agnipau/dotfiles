# Anirak theme
#
# Inspired by Anirak for VSCode: "https://marketplace.visualstudio.com/items?itemName=barjo.anirak"

decl str anirak_builtin 'rgb:9ccdff'
face global anirak_builtin %opt{anirak_builtin}

decl str anirak_foreground 'rgb:f0f8ff'
face global anirak_foreground %opt{anirak_foreground}

decl str anirak_string_literal 'rgb:599aff'
face global anirak_string_literal %opt{anirak_string_literal}

decl str anirak_dimmed 'rgb:757c88'
face global anirak_dimmed %opt{anirak_dimmed}

decl str anirak_dimmed_darker_important 'rgb:5c636d'
face global anirak_dimmed_darker_important %opt{anirak_dimmed_darker_important}

decl str anirak_dimmed_darker 'rgb:585d67'
face global anirak_dimmed_darker %opt{anirak_dimmed_darker}

decl str anirak_dimmed_darkest 'rgb:292c37'
face global anirak_dimmed_darkest %opt{anirak_dimmed_darkest}

decl str anirak_background 'rgb:22252e'
face global anirak_background %opt{anirak_background}

decl str anirak_background_cursor_line 'rgb:292c37'
face global anirak_background_cursor_line %opt{anirak_background_cursor_line}

decl str anirak_cursor 'rgb:303eff'
face global anirak_cursor %opt{anirak_cursor}

decl str anirak_accent 'rgb:17ff93'
face global anirak_accent %opt{anirak_accent}

decl str anirak_selection 'rgb:1b2060'
face global anirak_selection %opt{anirak_selection}

decl str anirak_highlight_inactive 'rgb:233551'
face global anirak_highlight_inactive %opt{anirak_highlight_inactive}

decl str anirak_highlight_active 'rgb:426498'
face global anirak_highlight_active %opt{anirak_highlight_active}

decl str anirak_lint_error_bg 'rgb:241517'
face global anirak_lint_error_bg %opt{anirak_lint_error_bg}

decl str anirak_lint_error_fg 'rgb:ff6464'
face global anirak_lint_error_fg %opt{anirak_lint_error_fg}

decl str anirak_lint_hint_bg 'rgb:0d2023'
face global anirak_lint_hint_bg %opt{anirak_lint_hint_bg}

decl str anirak_lint_hint_fg 'rgb:2faf64'
face global anirak_lint_hint_fg %opt{anirak_lint_hint_fg}

decl str anirak_lint_info_bg 'rgb:0a232c'
face global anirak_lint_info_bg %opt{anirak_lint_info_bg}

decl str anirak_lint_info_fg 'rgb:00b7e4'
face global anirak_lint_info_fg %opt{anirak_lint_info_fg}

decl str anirak_lint_warning_bg 'rgb:271c13'
face global anirak_lint_warning_bg %opt{anirak_lint_warning_bg}

decl str anirak_lint_warning_fg 'rgb:fa973a'
face global anirak_lint_warning_fg %opt{anirak_lint_warning_fg}

decl str anirak_lint_underline 'rgb:ffe89e'
face global anirak_lint_underline %opt{anirak_lint_underline}

decl str anirak_menu_active_bg 'rgb:3a3d46'
face global anirak_menu_active_bg %opt{anirak_menu_active_bg}

decl str anirak_menu_inactive_bg 'rgb:21232b'
face global anirak_menu_inactive_bg %opt{anirak_menu_inactive_bg}

decl str anirak_menu_sthumb 'rgb:3c3e46'
face global anirak_menu_sthumb %opt{anirak_menu_sthumb}

decl str anirak_debugging 'rgb:ff0000'
face global anirak_debugging %opt{anirak_debugging}

decl str anirak_term_0 'rgb:1e2227'
face global anirak_term_0 %opt{anirak_term_0}

decl str anirak_term_1 'rgb:ff4766'
face global anirak_term_1 %opt{anirak_term_1}

decl str anirak_term_2 'rgb:17ff93'
face global anirak_term_2 %opt{anirak_term_2}

decl str anirak_term_3 'rgb:ffdc69'
face global anirak_term_3 %opt{anirak_term_3}

decl str anirak_term_4 'rgb:3743ee'
face global anirak_term_4 %opt{anirak_term_4}

decl str anirak_term_5 'rgb:4a8ffd'
face global anirak_term_5 %opt{anirak_term_5}

decl str anirak_term_6 'rgb:75abff'
face global anirak_term_6 %opt{anirak_term_6}

decl str anirak_term_7 'rgb:f5faff'
face global anirak_term_7 %opt{anirak_term_7}

decl str anirak_term_8 'rgb:3a434d'
face global anirak_term_8 %opt{anirak_term_8}

decl str anirak_term_9 'rgb:ff8398'
face global anirak_term_9 %opt{anirak_term_9}

decl str anirak_term_10 'rgb:71faba'
face global anirak_term_10 %opt{anirak_term_10}

decl str anirak_term_11 'rgb:ffe388'
face global anirak_term_11 %opt{anirak_term_11}

decl str anirak_term_12 'rgb:6485f1'
face global anirak_term_12 %opt{anirak_term_12}

decl str anirak_term_13 'rgb:7aadff'
face global anirak_term_13 %opt{anirak_term_13}

decl str anirak_term_14 'rgb:bad3ff'
face global anirak_term_14 %opt{anirak_term_14}

decl str anirak_term_15 'rgb:ffffff'
face global anirak_term_15 %opt{anirak_term_15}

# self
face global value %opt{anirak_accent}
# types
face global type %opt{anirak_foreground}
# variables
face global variable %opt{anirak_foreground}
# module (use crate::ident_type::IdentType)
face global module %opt{anirak_foreground}
# functions
face global function "%opt{anirak_foreground}+b"
# string literal
face global string %opt{anirak_string_literal}
# default keywords
face global keyword %opt{anirak_dimmed}
face global operator %opt{anirak_dimmed}
# other default keywords
face global attribute %opt{anirak_builtin}
# comments
face global comment %opt{anirak_dimmed_darker_important}
# documentation comments
face global documentation %opt{anirak_dimmed_darker_important}
# macros and attributes
face global meta %opt{anirak_foreground}
face global builtin %opt{anirak_debugging}

face global error %opt{anirak_lint_error_fg}
face global noise %opt{anirak_dimmed}

face global title %opt{anirak_debugging}
face global header %opt{anirak_debugging}
face global mono %opt{anirak_debugging}
face global block %opt{anirak_debugging}
face global link %opt{anirak_debugging}
face global bullet %opt{anirak_debugging}
face global list %opt{anirak_debugging}

add-highlighter global/ line '%val{cursor_line}' "default,%opt{anirak_background_cursor_line}"

face global Default "%opt{anirak_foreground},%opt{anirak_background}"

face global PrimarySelection "default,%opt{anirak_selection}"
face global PrimaryCursor "%opt{anirak_foreground},%opt{anirak_cursor}"
face global PrimaryCursorEol "default,%opt{anirak_dimmed}"

face global SecondarySelection "default,%opt{anirak_highlight_active}"
face global SecondaryCursor "%opt{anirak_foreground},%opt{anirak_highlight_active}"
face global SecondaryCursorEol "default,%opt{anirak_dimmed}"

# face global MatchingChar "default,%opt{anirak_dimmed_darker}"
# face global Search "%opt{anirak_blue},%opt{anirak_green}"
# face global CurrentWord "%opt{anirak_white},%opt{anirak_blue}"

# listchars
# face global Whitespace "%opt{anirak_gray},default+f"
# ~ lines at EOB
face global BufferPadding "%opt{anirak_background},%opt{anirak_background}"
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

