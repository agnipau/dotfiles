# Detection.
# ‾‾‾‾‾‾‾‾‾‾

hook global BufCreate .*[.](rust|rs) %{
    set-option buffer filetype rust-custom
}

# Initialization.
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

hook global WinSetOption filetype=rust-custom %[
    require-module rust-custom
    hook window ModeChange pop:insert:.* -group rust-trim-indent rust-trim-indent
    hook window InsertChar \n -group rust-indent rust-indent-on-new-line
    hook window InsertChar \{ -group rust-indent rust-indent-on-opening-curly-brace
    hook window InsertChar [)}] -group rust-indent rust-indent-on-closing
    hook -once -always window WinSetOption filetype=.* %{ remove-hooks window rust-.+ }
]

hook -group rust-highlight global WinSetOption filetype=rust-custom %{
    add-highlighter window/rust-custom ref rust-custom
    hook -once -always window WinSetOption filetype=.* %{ remove-highlighter window/rust-custom }
}

provide-module rust-custom %§

# Highlighters.
# ‾‾‾‾‾‾‾‾‾‾‾‾‾

addhl shared/rust-custom regions
addhl shared/rust-custom/line_comment region // $ fill comment
addhl shared/rust-custom/block_comment region -recurse /\* /\* \*/ fill comment
# addhl shared/rust-custom/string region %{(?<!')"} (?<!\\)(\\\\)*" fill string
# addhl shared/rust-custom/raw_string region -match-capture %{(?<!')r(#*)"} %{"(#*)} fill string

addhl shared/rust-custom/code default-region group
addhl shared/rust-custom/code/char regex %{'(?:[^\\]|\\(?:.|x[0-9a-fA-F]{2}|u\{[0-9a-fA-F]{1,6}\}))'} 0:value
addhl shared/rust-custom/code/keywords regex \b(?:as|break|const|continue|crate|else|enum|extern|fn|for|if|impl|in|let|loop|match|mod|move|mut|pub|ref|return|self|static|struct|super|trait|type|unsafe|use|where|while|union)\b 0:keyword
addhl shared/rust-custom/code/keywords-2018 regex \b(?:async|await|dyn)\b 0:keyword
addhl shared/rust-custom/code/keywords-reserved regex \b(?:abstract|become|box|do|final|macro|override|priv|typeof|unsized|virtual|yield)\b 0:keyword
addhl shared/rust-custom/code/keywords-2018-reserved regex \btry\b 0:keyword
addhl shared/rust-custom/code/bool regex \b(?:true|false)\b 0:value
addhl shared/rust-custom/code/number regex \b(?:[0-9](?:[0-9]|_)*|0(?:b(?:[01]|_)*[01](?:[01]|_)*|x(?:[0-9a-fA-F]|_)*[0-9a-fA-F](?:[0-9a-fA-F]|_)*|o(?:[0-7]|_)*[0-7](?:[0-7]|_)*))(?:u8|u16|u32|u64|u128|usize|i8|i16|i32|i64|i128|isize)?\b 0:value
addhl shared/rust-custom/code/function_declaration regex fn\h+(\w+)(?:<[^>]+?>)?\( 1:function
addhl shared/rust-custom/code/function_call regex \b([a-zA-Z_]\w*\s*)\([^)]*\)(?!\s=>) 1:function
addhl shared/rust-custom/code/quoted regex %{'(?:(?:[a-zA-Z]\w*|_\w+)|_)} 0:attribute
addhl shared/rust-custom/code/macro_call regex \b[a-zA-Z_]\w*! 0:meta
# addhl shared/rust-custom/code/string regex (?<!')r?".*?(?<!\\)" 0:string
# addhl shared/rust-custom/code/hash_string regex (?<!')r#+".*?(?<!\\)"#+ 0:string

addhl shared/rust-custom/code/hash_string regex %{(?<!')r#+".*?"#+} 0:string
addhl shared/rust-custom/code/string regex %{(?<!['#r])".*?(?<!\\)"} 0:string


addhl shared/rust-custom/code/primitive_types regex \b(?:u8|u16|u32|u64|u128|usize|i8|i16|i32|i64|i128|isize|f32|f64|bool|char|str|Self)\b 0:type
addhl shared/rust-custom/code/variable_declaration regex let\h+(?:mut\h+)?([a-zA-Z_]\w*) 1:variable
addhl shared/rust-custom/code/module regex [a-zA-Z]\w*\h*(?=::) 0:module

# addhl shared/rust-custom/line_doctest region ^\h*//[!/]\h*```($|should_panic|no_run|ignore|allow_fail|rust|test_harness|compile_fail|E\d{4}|edition201[58]) ^\h*//[!/]\h*```$ regions
# addhl shared/rust-custom/line_doctest/marker region ```.* $ group
# addhl shared/rust-custom/line_doctest/marker/fence regex ``` 0:meta
# addhl shared/rust-custom/line_doctest/marker/keywords regex [\d\w] 0:meta # already matched above, just ignore comma
# addhl shared/rust-custom/line_doctest/inner region '^\h*//[!/]( #(?= )|)' '$| ' group
# addhl shared/rust-custom/line_doctest/inner/comment regex //[!/] 0:documentation
# addhl shared/rust-custom/line_doctest/inner/hidden regex '#' 0:meta
# addhl shared/rust-custom/line_doctest/code default-region ref rust
# addhl shared/rust-custom/line_code_rest region ^\h*//[!/]\h*``` ^\h*//[!/]\h*```$ fill documentation # reset invalid doctest
# addhl shared/rust-custom/line_comment2 region //[!/]{2} $ fill comment
# addhl shared/rust-custom/line_doc region //[!/] $ fill documentation
# addhl shared/rust-custom/line_comment1 region // $ fill comment

# addhl shared/rust-custom/block_comment2 region -recurse /\*\*\* /\*\*\* \*/ fill comment
# addhl shared/rust-custom/block_doc region -recurse /\*\* /\*\* \*/ regions
# addhl shared/rust-custom/block_doc/doctest region ```($|should_panic|no_run|ignore|allow_fail|rust|test_harness|compile_fail|E\d{4}|edition201[58]) ```$ regions
# addhl shared/rust-custom/block_doc/doctest/marker region ```.* $ group
# addhl shared/rust-custom/block_doc/doctest/marker/fence regex ``` 0:meta
# addhl shared/rust-custom/block_doc/doctest/marker/keywords regex [\d\w] 0:meta # already matched above, just ignore comma
# addhl shared/rust-custom/block_doc/doctest/inner default-region group
# addhl shared/rust-custom/block_doc/doctest/inner/hidden regex '^\h*\**\h*#' 0:meta
# addhl shared/rust-custom/block_doc/doctest/inner/comment regex ^\h*\* 0:documentation
# addhl shared/rust-custom/block_doc/doctest/inner/code ref rust
# addhl shared/rust-custom/block_doc/code_rest region ``` ``` fill documentation
# addhl shared/rust-custom/block_doc/doc default-region fill documentation
# addhl shared/rust-custom/block_comment1 region -recurse /\* /\* \*/ fill comment

# addhl shared/rust-custom/macro_attributes region -recurse "\[" "#!?\[" "\]" regions
# addhl shared/rust-custom/macro_attributes/ default-region fill meta
# addhl shared/rust-custom/macro_attributes/string region %{(?<!')"} (?<!\\)(\\\\)*" fill string
# addhl shared/rust-custom/macro_attributes/raw_string region -match-capture %{(?<!')r(#*)"} %{"(#*)} fill string

# addhl shared/rust-custom/code/field_or_parameter regex (_?\w+)(?::)(?!:) 1:variable
# addhl shared/rust-custom/code/namespace regex [a-zA-Z](\w+)?(\h+)?(?=::) 0:module
# addhl shared/rust-custom/code/field regex ((?<!\.\.)(?<=\.))_?[a-zA-Z]\w*\b 0:meta
# addhl shared/rust-custom/code/user_defined_type regex \b[A-Z]\w*\b 0:type
# addhl shared/rust-custom/code/variable_declaration regex (?:let\h+(?:mut\h+)?)(_?\w+) 1:variable
# addhl shared/rust-custom/code/char_character regex "'([^\\]|\\(.|x[0-9a-fA-F]{2}|u\{[0-9a-fA-F]{1,6}\}))'" 0:green
# # TODO highlight error for unicode or single escape byte character
# addhl shared/rust-custom/code/byte_character regex b'([\x00-\x5B\x5D-\x7F]|\\(.|x[0-9a-fA-F]{2}))' 0:yellow
# addhl shared/rust-custom/code/builtin_types regex \b(?:u8|u16|u32|u64|u128|usize|i8|i16|i32|i64|i128|isize|f32|f64|bool|char|str|Self)\b 0:type

# addhl shared/rust-custom/code/noise regex "(?:::|\{|\}|,|\.|:|\(|\)|;|->|=>|<|>|\[|\]|&)" 0:noise
# addhl shared/rust-custom/code/operator regex "(?:==|&&|\|\||\+=|-=|\*=|\\/=|!=|=|!|\*|\||-|\+|/)" 0:operator

# Commands
# ‾‾‾‾‾‾‾‾

define-command -hidden rust-trim-indent %{
    # remove trailing white spaces
    try %{ execute-keys -draft -itersel <a-x> s \h+$ <ret> d }
}

define-command -hidden rust-indent-on-new-line %~
    evaluate-commands -draft -itersel %<
        try %{
            try %[ # line comment
                evaluate-commands -draft -save-regs '/"' %[
                    # copy the commenting prefix
                    execute-keys -save-regs '' k <a-x> s ^\h*//[!/]{0,2}\h* <ret> y
                    try %[
                        # if the previous comment isn't empty, create a new one
                        execute-keys <a-x><a-K>^\h*//[!/]{0,2}$<ret> j<a-x>s^\h*<ret>P
                    ] catch %[
                        # TODO figure out a way to not delete empty comment in current line
                        # if there is no space and text in the previous comment, remove it completely
                        execute-keys s //.*<ret> d
                    ]
                ]
            ] catch %[ # block comment
                # if the previous line isn't within a comment scope, break
                execute-keys -draft k<a-x> <a-k>^(\h*/\*|\h+\*(?!/))<ret>

                # find comment opening, validate it was not closed, and check its using star prefixes
                execute-keys -draft <a-?>/\*<ret><a-H> <a-K>\*/<ret> <a-k>\A\h*/\*([^\n]*\n\h*\*)*[^\n]*\n\h*.\z<ret>

                try %[
                    # if the previous line is opening the comment, insert star preceeded by space
                    execute-keys -draft k<a-x><a-k>^\h*/\*<ret>
                    execute-keys -draft i*<space><esc>
                ] catch %[
                    try %[
                        # if the next line is a comment line insert a star
                        execute-keys -draft j<a-x><a-k>^\h+\*<ret>
                        execute-keys -draft i*<space><esc>
                    ] catch %[
                        try %[
                            # if the previous line is an empty comment line, close the comment scope
                            execute-keys -draft k<a-x><a-k>^\h+\*\h+$<ret> <a-x>1s\*(\h*)<ret>c/<esc>
                        ] catch %[
                            # if the previous line is a non-empty comment line, add a star
                            execute-keys -draft i*<space><esc>
                        ]
                    ]
                ]

                # trim trailing whitespace on the previous line
                try %[ execute-keys -draft s\h+$<ret> d ]
                # align the new star with the previous one
                execute-keys K<a-x>1s^[^*]*(\*)<ret>&
            ]
        } catch %`
            # preserve previous line indent
            try %{ execute-keys -draft <semicolon> K <a-&> }
            # indent after lines ending with { or (
            try %[ execute-keys -draft k <a-x> <a-k> [{(]\h*$ <ret> j <a-gt> ]
            # indent after lines ending with [{(].+ and move first parameter to own line
            try %< execute-keys -draft [c[({],[)}] <ret> <a-k> \A[({][^\n]+\n[^\n]*\n?\z <ret> L i<ret><esc> <gt> <a-S> <a-&> >
            # indent lines with a standalone where
            try %+ execute-keys -draft k <a-x> <a-k> ^\h*where\h*$ <ret> j <a-gt> +
            # dedent after lines starting with . and ending with , or ;
            try %_ execute-keys -draft k <a-x> <a-k> ^\h*\..*[,<semicolon>]\h*$ <ret> j <a-lt> _
            # deindent closing brace(s) when after cursor
            try %= execute-keys -draft <a-x> <a-k> ^\h*[})] <ret> gh / [})] <ret> m <a-S> 1<a-&> =
            # todo dedent additional unmatched parenthesis
            # try %& execute-keys -draft k <a-x> s \((?:[^)(]+|\((?:[^)(]+|\([^)(]*\))*\))*\) l Gl s\) %sh{
                # count previous selections length
                # printf "j $(echo $kak_selections_length | wc -w) <a-lt>"
            # } &
        `
        # filter previous line
        try %{ execute-keys -draft k : rust-trim-indent <ret> }
    >
~

define-command -hidden rust-indent-on-opening-curly-brace %[
    evaluate-commands -draft -itersel %_
        # align indent with opening paren when { is entered on a new line after the closing paren
        try %[ execute-keys -draft h <a-F> ) M <a-k> \A\(.*\)\h*\n\h*\{\z <ret> s \A|.\z <ret> 1<a-&> ]
        # dedent standalone { after impl and related block without any { in between
        try %< execute-keys -draft hh <a-?> impl|fn|struct|enum|union <ret> <a-K> \{ <ret> <a-semicolon> <semicolon> ll <a-x> <a-k> ^\h*\{$ <ret> <a-lt> >
    _
]

define-command -hidden rust-indent-on-closing %[
    evaluate-commands -draft -itersel %_
        # align to opening curly brace or paren when alone on a line
        try %< execute-keys -draft <a-h> <a-k> ^\h*[)}]$ <ret> h m <a-S> 1<a-&> >
    _
]

§
