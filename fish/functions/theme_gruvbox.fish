#!/usr/bin/fish
#
function theme_gruvbox
    if [ (echo $TERM | cut -d- -f1) = "screen" ]
      if [ -n "$TMUX" ]
        printf "\033Ptmux;\033\033]4;236;rgb:32/30/2f\007\033\\"
        printf "\033Ptmux;\033\033]4;234;rgb:1d/20/21\007\033\\"

        printf "\033Ptmux;\033\033]4;235;rgb:28/28/28\007\033\\"
        printf "\033Ptmux;\033\033]4;237;rgb:3c/38/36\007\033\\"
        printf "\033Ptmux;\033\033]4;239;rgb:50/49/45\007\033\\"
        printf "\033Ptmux;\033\033]4;241;rgb:66/5c/54\007\033\\"
        printf "\033Ptmux;\033\033]4;243;rgb:7c/6f/64\007\033\\"

        printf "\033Ptmux;\033\033]4;244;rgb:92/83/74\007\033\\"
        printf "\033Ptmux;\033\033]4;245;rgb:92/83/74\007\033\\"

        printf "\033Ptmux;\033\033]4;228;rgb:f2/e5/bc\007\033\\"
        printf "\033Ptmux;\033\033]4;230;rgb:f9/f5/d7\007\033\\"

        printf "\033Ptmux;\033\033]4;229;rgb:fb/f1/c7\007\033\\"
        printf "\033Ptmux;\033\033]4;223;rgb:eb/db/b2\007\033\\"
        printf "\033Ptmux;\033\033]4;250;rgb:d5/c4/a1\007\033\\"
        printf "\033Ptmux;\033\033]4;248;rgb:bd/ae/93\007\033\\"
        printf "\033Ptmux;\033\033]4;246;rgb:a8/99/84\007\033\\"

        printf "\033Ptmux;\033\033]4;167;rgb:fb/49/34\007\033\\"
        printf "\033Ptmux;\033\033]4;142;rgb:b8/bb/26\007\033\\"
        printf "\033Ptmux;\033\033]4;214;rgb:fa/bd/2f\007\033\\"
        printf "\033Ptmux;\033\033]4;109;rgb:83/a5/98\007\033\\"
        printf "\033Ptmux;\033\033]4;175;rgb:d3/86/9b\007\033\\"
        printf "\033Ptmux;\033\033]4;108;rgb:8e/c0/7c\007\033\\"
        printf "\033Ptmux;\033\033]4;208;rgb:fe/80/19\007\033\\"

        printf "\033Ptmux;\033\033]4;88;rgb:9d/00/06\007\033\\"
        printf "\033Ptmux;\033\033]4;100;rgb:79/74/0e\007\033\\"
        printf "\033Ptmux;\033\033]4;136;rgb:b5/76/14\007\033\\"
        printf "\033Ptmux;\033\033]4;24;rgb:07/66/78\007\033\\"
        printf "\033Ptmux;\033\033]4;96;rgb:8f/3f/71\007\033\\"
        printf "\033Ptmux;\033\033]4;66;rgb:42/7b/58\007\033\\"
        printf "\033Ptmux;\033\033]4;130;rgb:af/3a/03\007\033\\"
      else
        printf "\033P\033]4;236;rgb:32/30/2f\007\033\\"
        printf "\033P\033]4;234;rgb:1d/20/21\007\033\\"

        printf "\033P\033]4;235;rgb:28/28/28\007\033\\"
        printf "\033P\033]4;237;rgb:3c/38/36\007\033\\"
        printf "\033P\033]4;239;rgb:50/49/45\007\033\\"
        printf "\033P\033]4;241;rgb:66/5c/54\007\033\\"
        printf "\033P\033]4;243;rgb:7c/6f/64\007\033\\"

        printf "\033P\033]4;244;rgb:92/83/74\007\033\\"
        printf "\033P\033]4;245;rgb:92/83/74\007\033\\"

        printf "\033P\033]4;228;rgb:f2/e5/bc\007\033\\"
        printf "\033P\033]4;230;rgb:f9/f5/d7\007\033\\"

        printf "\033P\033]4;229;rgb:fb/f1/c7\007\033\\"
        printf "\033P\033]4;223;rgb:eb/db/b2\007\033\\"
        printf "\033P\033]4;250;rgb:d5/c4/a1\007\033\\"
        printf "\033P\033]4;248;rgb:bd/ae/93\007\033\\"
        printf "\033P\033]4;246;rgb:a8/99/84\007\033\\"

        printf "\033P\033]4;167;rgb:fb/49/34\007\033\\"
        printf "\033P\033]4;142;rgb:b8/bb/26\007\033\\"
        printf "\033P\033]4;214;rgb:fa/bd/2f\007\033\\"
        printf "\033P\033]4;109;rgb:83/a5/98\007\033\\"
        printf "\033P\033]4;175;rgb:d3/86/9b\007\033\\"
        printf "\033P\033]4;108;rgb:8e/c0/7c\007\033\\"
        printf "\033P\033]4;208;rgb:fe/80/19\007\033\\"

        printf "\033P\033]4;88;rgb:9d/00/06\007\033\\"
        printf "\033P\033]4;100;rgb:79/74/0e\007\033\\"
        printf "\033P\033]4;136;rgb:b5/76/14\007\033\\"
        printf "\033P\033]4;24;rgb:07/66/78\007\033\\"
        printf "\033P\033]4;96;rgb:8f/3f/71\007\033\\"
        printf "\033P\033]4;66;rgb:42/7b/58\007\033\\"
        printf "\033P\033]4;130;rgb:af/3a/03\007\033\\"
      end

    else if [ "$TERM" != "linux" -a "$TERM" != "vt100" -a "$TERM" != "vt220" ]

      printf "\033]4;236;rgb:32/30/2f\033\\"
      printf "\033]4;234;rgb:1d/20/21\033\\"

      printf "\033]4;235;rgb:28/28/28\033\\"
      printf "\033]4;237;rgb:3c/38/36\033\\"
      printf "\033]4;239;rgb:50/49/45\033\\"
      printf "\033]4;241;rgb:66/5c/54\033\\"
      printf "\033]4;243;rgb:7c/6f/64\033\\"

      printf "\033]4;244;rgb:92/83/74\033\\"
      printf "\033]4;245;rgb:92/83/74\033\\"

      printf "\033]4;228;rgb:f2/e5/bc\033\\"
      printf "\033]4;230;rgb:f9/f5/d7\033\\"

      printf "\033]4;229;rgb:fb/f1/c7\033\\"
      printf "\033]4;223;rgb:eb/db/b2\033\\"
      printf "\033]4;250;rgb:d5/c4/a1\033\\"
      printf "\033]4;248;rgb:bd/ae/93\033\\"
      printf "\033]4;246;rgb:a8/99/84\033\\"

      printf "\033]4;167;rgb:fb/49/34\033\\"
      printf "\033]4;142;rgb:b8/bb/26\033\\"
      printf "\033]4;214;rgb:fa/bd/2f\033\\"
      printf "\033]4;109;rgb:83/a5/98\033\\"
      printf "\033]4;175;rgb:d3/86/9b\033\\"
      printf "\033]4;108;rgb:8e/c0/7c\033\\"
      printf "\033]4;208;rgb:fe/80/19\033\\"

      printf "\033]4;88;rgb:9d/00/06\033\\"
      printf "\033]4;100;rgb:79/74/0e\033\\"
      printf "\033]4;136;rgb:b5/76/14\033\\"
      printf "\033]4;24;rgb:07/66/78\033\\"
      printf "\033]4;96;rgb:8f/3f/71\033\\"
      printf "\033]4;66;rgb:42/7b/58\033\\"
      printf "\033]4;130;rgb:af/3a/03\033\\"
    end
end

##!/usr/bin/env fish

#function theme_gruvbox --description 'Apply gruvbox theme'
#  set -l mode 'light'
#  if test  (count $argv) -gt 0
#    set mode $argv[1]
#  end

#  set -g contrast 'medium'
#  if test  (count $argv) -gt 1
#    set contrast $argv[2]
#  end

#  switch $contrast
#  case 'soft'
#  case 'medium'
#  case 'hard'
#  case '*'
#      set_color $fish_color_error
#      echo 'Unknown contrast $contrast, choose soft, medium or hard'
#      set_color $fish_color_normal
#      return 1
#  end

#  switch $mode
#    case 'light'
#      __theme_gruvbox_base
#      __theme_gruvbox_light
#    case 'dark'
#      __theme_gruvbox_base
#      __theme_gruvbox_dark
#    case '*'
#      set_color $fish_color_error
#      echo 'Unknown mode $mode, choose light or dark'
#      set_color $fish_color_normal
#      return 1
#  end
#  __theme_gruvbox_palette
#  return 0
#end

#function __theme_gruvbox_base
#  __printf_color 1 'cc/24/1d'
#  __printf_color 2 '98/97/1a'
#  __printf_color 3 'd7/99/21'
#  __printf_color 4 '45/85/88'
#  __printf_color 5 'b1/62/86'
#  __printf_color 6 '68/9d/6a'
#end

#function __theme_gruvbox_light
#  set -l bg 'fb/f1/c7'
#  switch $contrast
#    case "soft"
#      set bg 'f2/e5/bc'
#    case "hard"
#      set bg 'f9/f5/d7'
#  end
#  command printf "\033]11;rgb:$bg\007"

#  set -l fg '3c/38/36'
#  command printf "\033]10;rgb:$fg\007"

#  __printf_color 0 $bg
#  __printf_color 7 '7c/6f/64'
#  __printf_color 8 '92/83/74'
#  __printf_color 9 '9d/00/06'
#  __printf_color 10 '79/74/0e'
#  __printf_color 11 'b5/76/14'
#  __printf_color 12 '07/66/78'
#  __printf_color 13 '8f/3f/71'
#  __printf_color 14 '42/7b/58'
#  __printf_color 15 $fg
#end

#function __theme_gruvbox_dark
#  set -l bg '28/28/28'
#  switch $contrast
#    case "soft"
#      set bg '32/30/2f'
#    case "hard"
#      set bg '1d/20/21'
#  end
#  command printf "\033]11;rgb:$bg\007"

#  set -l fg 'eb/db/b2'
#  command printf "\033]10;rgb:$fg\007"

#  __printf_color 0 $bg
#  __printf_color 7 'a8/99/84'
#  __printf_color 8 '92/83/74'
#  __printf_color 9 'fb/59/34'
#  __printf_color 10 'b8/bb/26'
#  __printf_color 11 'fa/bd/2f'
#  __printf_color 12 '83/a5/98'
#  __printf_color 13 'd3/86/9b'
#  __printf_color 14 '8e/c0/7c'
#  __printf_color 15 $fg
#end

#function __theme_gruvbox_palette
#  __printf_color 236 '32/30/2f'
#  __printf_color 234 '1d/20/21'

#  __printf_color 235 '28/28/28'
#  __printf_color 237 '3c/38/36'
#  __printf_color 239 '50/49/45'
#  __printf_color 241 '66/5c/54'
#  __printf_color 243 '7c/6f/64'

#  __printf_color 244 '92/83/74'
#  __printf_color 245 '92/83/74'

#  __printf_color 228 'f2/e5/bc'
#  __printf_color 230 'f9/f5/d7'

#  __printf_color 229 'fb/f1/c7'
#  __printf_color 223 'eb/db/b2'
#  __printf_color 250 'd5/c4/a1'
#  __printf_color 248 'bd/ae/93'
#  __printf_color 246 'a8/99/84'

#  __printf_color 167 'fb/49/34'
#  __printf_color 142 'b8/bb/26'
#  __printf_color 214 'fa/bd/2f'
#  __printf_color 109 '83/a5/98'
#  __printf_color 175 'd3/86/9b'
#  __printf_color 108 '8e/c0/7c'
#  __printf_color 208 'fe/80/19'

#  __printf_color 88 '9d/00/06'
#  __printf_color 100 '79/74/0e'
#  __printf_color 136 'b5/76/14'
#  __printf_color 24 '07/66/78'
#  __printf_color 96 '8f/3f/71'
#  __printf_color 66 '42/7b/58'
#  __printf_color 130 'af/3a/03'
#end

#function __printf_color
#  command printf "\033]4;$argv[1];rgb:$argv[2]\007"
#end

