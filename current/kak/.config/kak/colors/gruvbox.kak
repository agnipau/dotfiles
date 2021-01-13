# Gruvbox Dark Theme.
#
# Inspired by https://github.com/gruvbox-community/gruvbox.

# Base16 colors.
declare-option str gruvbox_c0_black 'rgb:1d2021'
declare-option str gruvbox_c1_red 'rgb:cc241d'
declare-option str gruvbox_c2_green 'rgb:98971a'
declare-option str gruvbox_c3_yellow 'rgb:d79921'
declare-option str gruvbox_c4_blue 'rgb:458588'
declare-option str gruvbox_c5_purple 'rgb:b16286'
declare-option str gruvbox_c6_aqua 'rgb:689d6a'
declare-option str gruvbox_c7_white 'rgb:a89984'
declare-option str gruvbox_c8_black 'rgb:928374'
declare-option str gruvbox_c9_red 'rgb:fb4934'
declare-option str gruvbox_c10_green 'rgb:b8bb26'
declare-option str gruvbox_c11_yellow 'rgb:fabd2f'
declare-option str gruvbox_c12_blue 'rgb:83a598'
declare-option str gruvbox_c13_purple 'rgb:d3869b'
declare-option str gruvbox_c14_aqua 'rgb:8ec07c'
declare-option str gruvbox_c15_white 'rgb:ebdbb2'

# Shades of gray.
declare-option str gruvbox_bg0_h 'rgb:1d2021'
declare-option str gruvbox_bg0 'rgb:282828'
declare-option str gruvbox_bg0_s 'rgb:32302f'
declare-option str gruvbox_bg1 'rgb:3c3836'
declare-option str gruvbox_bg2 'rgb:504945'
declare-option str gruvbox_bg3 'rgb:665c54'
declare-option str gruvbox_bg4 'rgb:7c6f64'
declare-option str gruvbox_gray 'rgb:928374'
declare-option str gruvbox_fg4 'rgb:a89984'
declare-option str gruvbox_fg3 'rgb:bdae93'
declare-option str gruvbox_fg2 'rgb:d5c4a1'
declare-option str gruvbox_fg1 'rgb:ebdbb2'
declare-option str gruvbox_fg0 'rgb:fbf1c7'

# Shades of orange.
declare-option str gruvbox_orange 'rgb:d65d0e'
declare-option str gruvbox_orange_bright 'rgb:fe8019'

# Code.
set-face global value "%opt{gruvbox_c13_purple}"
set-face global type "%opt{gruvbox_c11_yellow}"
set-face global variable "%opt{gruvbox_c12_blue}"
set-face global module "%opt{gruvbox_c14_aqua}"
set-face global function "%opt{gruvbox_c10_green}+b"
set-face global string "%opt{gruvbox_c10_green}"
set-face global keyword "%opt{gruvbox_c9_red}"
set-face global operator "%opt{gruvbox_c15_white}"
set-face global attribute "%opt{gruvbox_orange_bright}"
set-face global comment "%opt{gruvbox_c8_black}+a"
set-face global documentation "comment"
set-face global meta "%opt{gruvbox_c14_aqua}"
# face global builtin "default+b"
set-face global builtin "keyword"

# Markdown.
set-face global title "%opt{gruvbox_c10_green}+b"
set-face global header "%opt{gruvbox_c12_blue}+b"
set-face global mono "%opt{gruvbox_fg2}"
set-face global block "%opt{gruvbox_fg3}"
set-face global link "%opt{gruvbox_c13_purple}+u"
set-face global bullet "%opt{gruvbox_c14_aqua}"
set-face global list "%opt{gruvbox_fg0}"

# Builtins.
set-face global Default "%opt{gruvbox_fg0},%opt{gruvbox_bg0_h}"
set-face global PrimarySelection "default,%opt{gruvbox_bg3}+g"
set-face global SecondarySelection "default,%opt{gruvbox_bg1}+g"
set-face global PrimaryCursor "%opt{gruvbox_bg0_h},%opt{gruvbox_fg0}+fg"
set-face global SecondaryCursor "%opt{gruvbox_bg0_h},%opt{gruvbox_fg4}+fg"
set-face global PrimaryCursorEol "%opt{gruvbox_bg0_h},%opt{gruvbox_c11_yellow}+fg"
set-face global SecondaryCursorEol "%opt{gruvbox_bg0_h},%opt{gruvbox_c11_yellow}+fg"
set-face global LineNumbers "%opt{gruvbox_bg2}"
set-face global LineNumberCursor "%opt{gruvbox_c11_yellow}"
set-face global LineNumbersWrapped "%opt{gruvbox_bg0_h}"
set-face global MenuForeground "%opt{gruvbox_fg1},%opt{gruvbox_bg2}+b"
set-face global MenuBackground "default,%opt{gruvbox_bg1}"
set-face global MenuInfo "%opt{gruvbox_c12_blue}"
set-face global Information "%opt{gruvbox_fg4},%opt{gruvbox_bg0}"
set-face global Error "%opt{gruvbox_c9_red},default+b"
set-face global StatusLine "%opt{gruvbox_fg1},%opt{gruvbox_bg0}"
set-face global StatusLineMode "%opt{gruvbox_fg1}"
set-face global StatusLineInfo "%opt{gruvbox_fg4}"
set-face global StatusLineValue "%opt{gruvbox_c9_red}"
set-face global StatusCursor "%opt{gruvbox_bg0_h},%opt{gruvbox_fg0}"
set-face global Prompt "%opt{gruvbox_fg4}"
set-face global MatchingChar "default,%opt{gruvbox_bg1}"
set-face global BufferPadding "%opt{gruvbox_bg0_h},%opt{gruvbox_bg0_h}"
set-face global Whitespace "%opt{gruvbox_bg1}+f"

