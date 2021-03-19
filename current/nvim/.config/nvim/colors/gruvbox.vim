" Colors {{{
highlight! GruvboxGreen gui=nocombine guifg=#b8bb26
highlight! GruvboxGreenBold gui=bold guifg=#b8bb26
highlight! GruvboxGreenUnderline gui=underline guifg=#b8bb26
highlight! GruvboxWhite gui=nocombine guifg=#ebdbb2
highlight! GruvboxWhiteBold gui=bold guifg=#ebdbb2
highlight! GruvboxWhiteItalic gui=italic guifg=#ebdbb2
highlight! GruvboxPurple gui=nocombine guifg=#d3869b
highlight! GruvboxOrange gui=nocombine guifg=#fe8019
highlight! GruvboxAqua gui=nocombine guifg=#8ec07c
highlight! GruvboxAquaBold gui=bold guifg=#8ec07c
highlight! GruvboxGray gui=nocombine guifg=#a89984
highlight! GruvboxYellow gui=nocombine guifg=#fabd2f
highlight! GruvboxRed gui=nocombine guifg=#fb4934
highlight! GruvboxRedUnderline gui=underline guifg=#fb4934
highlight! GruvboxBlue gui=nocombine guifg=#83a598
highlight! GruvboxDebug gui=underline guibg=red guifg=black
" }}}

" Vim syntax hi groups {{{
highlight! link Statement GruvboxRed
highlight! link Conditional GruvboxRed
highlight! link Repeat GruvboxRed
highlight! link Label GruvboxRed
highlight! link Exception GruvboxRed
highlight! link Keyword GruvboxRed
highlight! link StorageClass GruvboxRed
highlight! link Structure GruvboxRed
highlight! link Typedef GruvboxRed

highlight! link Function GruvboxGreenBold
highlight! link String GruvboxGreen

highlight! link Identifier GruvboxWhite

highlight! link Operator GruvboxGray
highlight! link vimBracket GruvboxGray
highlight! link vimSetSep GruvboxGray
highlight! link vimParenSep GruvboxGray
highlight! link vimSep GruvboxGray
highlight! link vimContinue GruvboxGray

highlight! link PreProc GruvboxAqua
highlight! link Include GruvboxAqua
highlight! link Define GruvboxAqua
highlight! link Type GruvboxAqua
highlight! link Macro GruvboxAqua
highlight! link PreCondit GruvboxAqua
highlight! link vimNotation GruvboxAquaBold
highlight! link vimMapModKey GruvboxAquaBold

highlight! link Constant GruvboxPurple
highlight! link Character GruvboxPurple
highlight! link Boolean GruvboxPurple
highlight! link Number GruvboxPurple
highlight! link Float GruvboxPurple

highlight! link vimFuncSID GruvboxDebug
" }}}

" Misc {{{
highlight! Normal guibg=#1d2021 guifg=#ebdbb2
highlight! EndOfBuffer guifg=#1d2021
highlight! ColorColumn guibg=#282828 guifg=none
highlight! CursorLine guibg=#282828 guifg=none
highlight! CursorLineNr guibg=#282828 guifg=#fabd2f gui=nocombine
highlight! LineNr guifg=#928374
highlight! Visual guibg=#504945 gui=none
highlight! StatusLine gui=nocombine guibg=#504945 guifg=#ebdbb2
highlight! StatusLineNC gui=nocombine guibg=#282828 guifg=#ebdbb2
highlight! Search guibg=#fabd2f guifg=#1d2021
highlight! NonText guifg=#665c54 gui=none
highlight! VertSplit guibg=#282828 guifg=#282828
highlight! Folded guibg=#282828 guifg=#a89984
highlight! Cursor guifg=#fabd2f guibg=#1d2021
highlight! MatchParen guifg=#ebdbb2 guibg=#928374
highlight! TabLineFill guifg=#a89984 guibg=#282828
highlight! TabLineSel guifg=#ebdbb2 guibg=#504945
highlight! Comment guifg=#928374
highlight! SignColumn guibg=#282828
highlight! Pmenu guibg=#504945 guifg=#ebdbb2
highlight! PmenuSel gui=bold guibg=#665c54 guifg=#8ec07c
highlight! PmenuSbar guibg=#504945
highlight! PmenuThumb guibg=#7c6f64
" }}}

" Tree sitter {{{
highlight! link TSComment GruvboxDebug
highlight! link TSAnnotation GruvboxDebug
highlight! link TSAttribute GruvboxDebug
highlight! link TSCharacter GruvboxDebug
highlight! link TSConstMacro GruvboxDebug
highlight! link TSParameterReference GruvboxDebug
highlight! link TSText GruvboxDebug
highlight! link TSSymbol GruvboxDebug
highlight! link TSUnderline GruvboxDebug
highlight! link TSWarning GruvboxDebug
highlight! link TSDanger GruvboxDebug
highlight! link TSStrike GruvboxDebug
highlight! link TSNote GruvboxDebug

highlight! TSNone guibg=none guifg=none gui=none

highlight! link TSKeywordOperator GruvboxRed
highlight! link TSConditional GruvboxRed
highlight! link TSInclude GruvboxRed
highlight! link TSKeywordFunction GruvboxRed
highlight! link TSKeyword GruvboxRed
highlight! link TSRepeat GruvboxRed
highlight! link TSException GruvboxRed
highlight! link TSError GruvboxRedUnderline

highlight! link TSConstBuiltin GruvboxPurple
highlight! link TSBoolean GruvboxPurple
highlight! link TSNumber GruvboxPurple
highlight! link TSFloat GruvboxPurple
highlight! link TSVariableBuiltin GruvboxPurple

highlight! link TSLabel GruvboxOrange

highlight! link TSField GruvboxWhite
highlight! link TSParameter GruvboxWhite
highlight! link TSVariable GruvboxWhite
highlight! link TSTitle GruvboxWhiteBold
highlight! link TSEmphasis GruvboxWhiteItalic
highlight! link TSStrong GruvboxWhiteBold

highlight! link TSFuncBuiltin GruvboxGreenBold
highlight! link TSFunction GruvboxGreenBold
highlight! link TSMethod GruvboxGreenBold
highlight! link TSString GruvboxGreen
highlight! link TSURI GruvboxGreenUnderline

highlight! link TSTag GruvboxAquaBold
highlight! link TSNamespace GruvboxAqua
highlight! link TSType GruvboxAqua
highlight! link TSTypeBuiltin GruvboxAqua
highlight! link TSFuncMacro GruvboxAquaBold
highlight! link TSConstructor GruvboxAqua

highlight! link TSOperator GruvboxGray
highlight! link TSPunctBracket GruvboxGray
highlight! link TSPunctDelimiter GruvboxGray
highlight! link TSPunctSpecial GruvboxGray
highlight! link TSTagDelimiter GruvboxGray

highlight! link TSStringEscape GruvboxYellow
highlight! link TSStringRegex GruvboxYellow
" <code> tags
highlight! link TSLiteral GruvboxYellow

highlight! link TSConstant GruvboxBlue
highlight! link TSProperty GruvboxBlue
" }}}

" Builtin LSP {{{
highlight! link LspDiagnosticsDefaultError GruvboxDebug
highlight! link LspDiagnosticsDefaultHint GruvboxDebug
highlight! link LspDiagnosticsDefaultInformation GruvboxDebug
highlight! link LspDiagnosticsDefaultWarning GruvboxDebug

highlight! link LspDiagnosticsFloatingError GruvboxDebug
highlight! link LspDiagnosticsFloatingHint GruvboxDebug
highlight! link LspDiagnosticsFloatingInformation GruvboxDebug
highlight! link LspDiagnosticsFloatingWarning GruvboxDebug

highlight! LspDiagnosticsSignError guibg=#282828 guifg=#fb4934
highlight! LspDiagnosticsSignHint guibg=#282828 guifg=#8ec07c
highlight! LspDiagnosticsSignInformation guibg=#282828 guifg=#83a598
highlight! LspDiagnosticsSignWarning guibg=#282828 guifg=#fe8019

highlight! LspDiagnosticsUnderlineError gui=nocombine guibg=none guifg=none
highlight! LspDiagnosticsUnderlineHint gui=nocombine guibg=none guifg=none
highlight! LspDiagnosticsUnderlineInformation gui=nocombine guibg=none guifg=none
highlight! LspDiagnosticsUnderlineWarning gui=nocombine guibg=none guifg=none

highlight! link LspDiagnosticsVirtualTextError GruvboxRed
highlight! link LspDiagnosticsVirtualTextHint GruvboxAqua
highlight! link LspDiagnosticsVirtualTextInformation GruvboxBlue
highlight! link LspDiagnosticsVirtualTextWarning GruvboxOrange

highlight! link LspReferenceRead Visual
highlight! LspReferenceText guibg=#928374
highlight! LspReferenceWrite guibg=#928374
" }}}

