# Gruvbox Dark Theme.
#
# Inspired by https://github.com/gruvbox-community/gruvbox.

# Base16 colors.
decl str gruvbox_c0_black   'rgb:282828'
decl str gruvbox_c1_red     'rgb:cc241d'
decl str gruvbox_c2_green   'rgb:98971a'
decl str gruvbox_c3_yellow  'rgb:d79921'
decl str gruvbox_c4_blue    'rgb:458588'
decl str gruvbox_c5_purple  'rgb:b16286'
decl str gruvbox_c6_aqua    'rgb:689d6a'
decl str gruvbox_c7_white   'rgb:a89984'
decl str gruvbox_c8_black   'rgb:928374'
decl str gruvbox_c9_red     'rgb:fb4934'
decl str gruvbox_c10_green  'rgb:b8bb26'
decl str gruvbox_c11_yellow 'rgb:fabd2f'
decl str gruvbox_c12_blue   'rgb:83a598'
decl str gruvbox_c13_purple 'rgb:d3869b'
decl str gruvbox_c14_aqua   'rgb:8ec07c'
decl str gruvbox_c15_white  'rgb:ebdbb2'

# Shades of gray.
decl str gruvbox_bg0_h 'rgb:1d2021'
decl str gruvbox_bg0   'rgb:282828'
decl str gruvbox_bg0_s 'rgb:32302f'
decl str gruvbox_bg1   'rgb:3c3836'
decl str gruvbox_bg2   'rgb:504945'
decl str gruvbox_bg3   'rgb:665c54'
decl str gruvbox_bg4   'rgb:7c6f64'
decl str gruvbox_gray  'rgb:928374'
decl str gruvbox_fg4   'rgb:a89984'
decl str gruvbox_fg3   'rgb:bdae93'
decl str gruvbox_fg2   'rgb:d5c4a1'
decl str gruvbox_fg1   'rgb:ebdbb2'
decl str gruvbox_fg0   'rgb:fbf1c7'

# Shades of orange.
decl str gruvbox_orange        'rgb:d65d0e'
decl str gruvbox_orange_bright 'rgb:fe8019'

# Code.
face global value         "%opt{gruvbox_c13_purple}"
face global type          "%opt{gruvbox_c11_yellow}"
face global variable      "%opt{gruvbox_c12_blue}"
face global module        "%opt{gruvbox_c14_aqua}"
face global function      "%opt{gruvbox_c10_green}+b"
face global string        "%opt{gruvbox_c10_green}"
face global keyword       "%opt{gruvbox_c9_red}"
face global operator      "%opt{gruvbox_c15_white}"
face global attribute     "%opt{gruvbox_orange_bright}"
face global comment       "%opt{gruvbox_c8_black}+a"
face global documentation "comment"
face global meta          "%opt{gruvbox_c14_aqua}"
face global builtin       "default+b"

# Markdown.
face global title  "%opt{gruvbox_c10_green}+b"
face global header "%opt{gruvbox_c12_blue}+b"
face global mono   "%opt{gruvbox_fg2}"
face global block  "%opt{gruvbox_fg3}"
face global link   "%opt{gruvbox_c13_purple}+u"
face global bullet "%opt{gruvbox_c14_aqua}"
face global list   "%opt{gruvbox_fg0}"

# Builtins.
face global Default            "%opt{gruvbox_fg0},%opt{gruvbox_bg0}"
face global PrimarySelection   "default,%opt{gruvbox_bg4}+g"
face global SecondarySelection "default,%opt{gruvbox_bg2}+g"
face global PrimaryCursor      "%opt{gruvbox_bg0},%opt{gruvbox_fg0}+fg"
face global SecondaryCursor    "%opt{gruvbox_bg0},%opt{gruvbox_fg4}+fg"
face global PrimaryCursorEol   "%opt{gruvbox_bg0},%opt{gruvbox_c11_yellow}+fg"
face global SecondaryCursorEol "%opt{gruvbox_bg0},%opt{gruvbox_c11_yellow}+fg"
face global LineNumbers        "%opt{gruvbox_bg3}"
face global LineNumberCursor   "%opt{gruvbox_c11_yellow}"
face global LineNumbersWrapped "%opt{gruvbox_bg0}"
face global MenuForeground     "%opt{gruvbox_fg1},%opt{gruvbox_bg3}+b"
face global MenuBackground     "default,%opt{gruvbox_bg2}"
face global MenuInfo           "%opt{gruvbox_c12_blue}"
face global Information        "%opt{gruvbox_fg4},%opt{gruvbox_bg1}"
face global Error              "%opt{gruvbox_c9_red},default+b"
face global StatusLine         "%opt{gruvbox_fg1},%opt{gruvbox_bg1}"
face global StatusLineMode     "%opt{gruvbox_fg1}"
face global StatusLineInfo     "%opt{gruvbox_fg4}"
face global StatusLineValue    "%opt{gruvbox_c9_red}"
face global StatusCursor       "%opt{gruvbox_bg0},%opt{gruvbox_fg0}"
face global Prompt             "%opt{gruvbox_fg4}"
face global MatchingChar       "default,%opt{gruvbox_bg2}"
face global BufferPadding      "%opt{gruvbox_bg0},%opt{gruvbox_bg0}"
face global Whitespace         "%opt{gruvbox_bg2}+f"

