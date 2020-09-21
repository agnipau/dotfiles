# Anirak Theme.
#
# Inspired by Anirak for VSCode:
# https://marketplace.visualstudio.com/items?itemName=barjo.anirak.

decl str anirak_builtin        'rgb:9ccdff'
decl str anirak_foreground     'rgb:f0f8ff'
decl str anirak_string_literal 'rgb:599aff'
decl str anirak_accent         'rgb:17ff93'

decl str anirak_dimmed                  'rgb:757c88'
decl str anirak_dimmed_darker_important 'rgb:5c636d'
decl str anirak_dimmed_darker           'rgb:585d67'
decl str anirak_dimmed_darkest          'rgb:292c37'

decl str anirak_background             'rgb:0c0d10'
decl str anirak_background_cursor_line 'rgb:111217'
decl str anirak_cursor                 'rgb:303eff'

decl str anirak_selection          'rgb:15194c'
decl str anirak_highlight_inactive 'rgb:233551'
decl str anirak_highlight_active   'rgb:426498'

decl str anirak_lint_error_bg   'rgb:241517'
decl str anirak_lint_error_fg   'rgb:ff6464'
decl str anirak_lint_hint_bg    'rgb:0d2023'
decl str anirak_lint_hint_fg    'rgb:2faf64'
decl str anirak_lint_info_bg    'rgb:0a232c'
decl str anirak_lint_info_fg    'rgb:00b7e4'
decl str anirak_lint_warning_bg 'rgb:271c13'
decl str anirak_lint_warning_fg 'rgb:fa973a'
decl str anirak_lint_underline  'rgb:ffe89e'

decl str anirak_menu_active_bg   'rgb:3a3d46'
decl str anirak_menu_inactive_bg 'rgb:21232b'
decl str anirak_menu_sthumb      'rgb:3c3e46'

decl str anirak_debugging 'rgb:ff0000'

decl str anirak_term_0  'rgb:1e2227'
decl str anirak_term_1  'rgb:ff4766'
decl str anirak_term_2  'rgb:17ff93'
decl str anirak_term_3  'rgb:ffdc69'
decl str anirak_term_4  'rgb:3743ee'
decl str anirak_term_5  'rgb:4a8ffd'
decl str anirak_term_6  'rgb:75abff'
decl str anirak_term_7  'rgb:f5faff'
decl str anirak_term_8  'rgb:3a434d'
decl str anirak_term_9  'rgb:ff8398'
decl str anirak_term_10 'rgb:71faba'
decl str anirak_term_11 'rgb:ffe388'
decl str anirak_term_12 'rgb:6485f1'
decl str anirak_term_13 'rgb:7aadff'
decl str anirak_term_14 'rgb:bad3ff'
decl str anirak_term_15 'rgb:ffffff'

# Code.
face global value         "%opt{anirak_accent}"
face global type          "%opt{anirak_foreground}"
face global variable      "%opt{anirak_foreground}"
face global module        "%opt{anirak_foreground}"
face global function      "%opt{anirak_foreground}+b"
face global string        "%opt{anirak_string_literal}"
face global keyword       "%opt{anirak_dimmed}"
face global operator      "%opt{anirak_dimmed}"
face global attribute     "%opt{anirak_builtin}"
face global comment       "%opt{anirak_dimmed_darker_important}"
face global documentation "%opt{anirak_dimmed_darker_important}"
face global meta          "%opt{anirak_foreground}"
face global builtin       "%opt{anirak_builtin}"

# Markup.
face global title         "%opt{anirak_debugging}"
face global header        "%opt{anirak_debugging}"
face global bold          "%opt{anirak_debugging}"
face global italic        "%opt{anirak_debugging}"
face global underline     "%opt{anirak_debugging}"
face global strikethrough "%opt{anirak_debugging}"
face global mono          "%opt{anirak_debugging}"
face global block         "%opt{anirak_debugging}"
face global link          "%opt{anirak_debugging}"
face global bullet        "%opt{anirak_debugging}"
face global list          "%opt{anirak_debugging}"

# Builtin.
face global Default            "%opt{anirak_foreground},%opt{anirak_background}"
face global PrimarySelection   "default,%opt{anirak_selection}"
face global SecondarySelection "default,%opt{anirak_highlight_inactive}"
face global PrimaryCursor      "%opt{anirak_foreground},%opt{anirak_cursor}"
face global SecondaryCursor    "%opt{anirak_foreground},%opt{anirak_highlight_active}"
face global PrimaryCursorEol   "default,%opt{anirak_dimmed_darker}"
face global SecondaryCursorEol "default,%opt{anirak_dimmed_darker}"
face global LineNumbers        "%opt{anirak_dimmed_darker},default"
face global LineNumberCursor   "%opt{anirak_foreground},%opt{anirak_background_cursor_line}"
face global LineNumbersWrapped "%opt{anirak_background},default"
face global MenuForeground     "%opt{anirak_foreground},%opt{anirak_menu_active_bg}+b"
face global MenuBackground     "%opt{anirak_dimmed},%opt{anirak_menu_inactive_bg}"
face global MenuInfo           "default,default"
face global Information        "%opt{anirak_foreground},%opt{anirak_menu_inactive_bg}"
face global Error              "%opt{anirak_lint_error_fg},default"
face global StatusLine         "%opt{anirak_foreground},default"
face global StatusLineMode     "%opt{anirak_builtin},default+b"
face global StatusLineInfo     "%opt{anirak_foreground},default"
face global StatusLineValue    "%opt{anirak_builtin},default+b"
face global StatusCursor       "%opt{anirak_foreground},%opt{anirak_cursor}"
face global Prompt             "%opt{anirak_builtin},default+b"
face global MatchingChar       "default,%opt{anirak_dimmed_darkest}"
face global BufferPadding      "%opt{anirak_background},%opt{anirak_background}"
face global Whitespace         "%opt{anirak_dimmed_darker},default+f"
face global WrapMarker         "Whitespace"

# Custom.
face global noise "%opt{anirak_dimmed}"

