def toggle-whitespaces -docstring 'toggle the visibility of whitespace characters' %{
    try %{
        addhl global/ show-whitespaces
    } catch %{
        rmhl global/show-whitespaces
    }
}

def pydef-debug -params 2.. %[
    eval %sh[
        py_tmp="$(mktemp).py"
        echo "$2" >"${py_tmp}"
        echo "
            def -override $1 %[
                eval %sh[
                    stderr=\"\$(mktemp)\"
                    python ${py_tmp} \$@ ${@:3} 2>\"\${stderr}\"
                    # stderr=\"\$(cat \"\${stderr}\" | sed -e \"s/'/''/g\" -e 's/{/\\\{/g' | xargs -I{} echo \"{Error}{}\")\"
                    stderr=\"\$(cat \"\${stderr}\" | sed -e \"s/'/''/g\" -e 's/{/\\\{/g')\"
                    [ -n \"\${stderr}\" ] && {
                        printf '%s\n' \"info -title 'Python error' -markup '\${stderr}'\"
                    }
                ]
            ]
            hook global KakEnd .* %{
                nop %sh{
                    rm -f \"${py_tmp}\"
                }
            }
        "
    ]
]

# TODO: Improve error handling.
def pydef -params 3 %{
    eval %sh{
        file="$(mktemp).py"
        pyfifo="${file}.pyfifo"
        kakfifo="${file}.kakfifo"
        mkfifo "${pyfifo}"
        mkfifo "${kakfifo}"
        >"${file}" printf "def line(stdin): $3\n"
        >>"${file}" printf '%s' "while True:
            with open('${pyfifo}', 'r', 1) as f:
                for s in f:
                    try:
                        reply = line(s)
                    except Exception as e:
                        reply = 'echo -debug %%~$1 error: {}~'.format(e)
                    with open('${kakfifo}', 'w') as r:
                        r.write(reply)"
        (python "${file}") >/dev/null 2>&1 </dev/null &
        pypid="$!"
        printf '%s' "
            def -override $1 %{
                echo -to-file ${pyfifo} \"$2\"
                eval %sh{ cat ${kakfifo} }
            }
            hook -group pydef global KakEnd .* %{
                nop %sh{
                    kill \"${pypid}\"
                    rm -f \"${file}\" \"${pyfifo}\" \"${kakfifo}\"
                }
            }
        "
    }
}

def xsel-copy %{
    exec %{<a-|>xsel -ib<ret>: echo -markup '{Information}yanked selection to system clipboard'<ret>}
}

# NOTE: Don't use xclip. It's really buggy.
pydef-debug "xsel-paste \
    -params 2 \
    -docstring 'paste from the system clipboard using xsel. Takes in consideration if the last line char is an EOL char, in that case the command will paste at the starting of the next line. This is the behaviour of the builtin `p` command'" \
%{
import os
import re
import sys

def escape(s):
    s = re.sub("'", "''", s)
    s = re.sub("<", "<lt>", s)
    s = re.sub("(?<!<lt)>", "<gt>", s)
    return s

def main():
    position, select = sys.argv[1:]
    if not position in ["after", "before"]:
        print(f"info -title 'xsel-paste error' -markup '{{Error}}Invalid position `{position}`, must be either `after` or `before`'")
        return
    if not select in ["true", "false"]:
        print(f"info -title 'xsel-paste error' -markup '{{Error}}Invalid select `{select}`, must be either `true` or `false`'")
        return
    else:
        select = select == "true"

    content = escape(os.popen('xsel -ob').read())

    if content.endswith("\n"):
        prefix = "o" if position == "after" else "O"
        switches = "-draft" if not select else ""
        suffix = "x" if select else ""
        print(f"execute-keys {switches} '{prefix}{content.rstrip()}<esc>{suffix}'")
        return

    if not select:
        switches = "-draft"
        prefix = "li" if position == "after" else "i"
        suffix = ""
    else:
        switches = ""
        prefix = "a" if position == "after" else "ha"
        suffix = "i<esc>La<esc>"
    print(f"execute-keys {switches} '{prefix}{content}<esc>{suffix}'")

main()
}

