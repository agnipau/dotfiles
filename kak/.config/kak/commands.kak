def toggle-whitespaces -docstring 'toggle the visibility of whitespace characters' %{
    try %{
        addhl global/ show-whitespaces
    } catch %{
        rmhl global/show-whitespaces
    }
}

# NOTE: Requires BASH.
def pydef-debug -params 2.. %[
    eval %sh[
        py_tmp="$(mktemp).py"
        echo "$2" >"${py_tmp}"
        echo "
            def -override $1 %[
                eval %sh[
                    stderr=\"\$(mktemp)\"
                    # \${@:3} causes problems in dash.
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
        >"${file}"  printf '%s\n' "def line(stdin): $3"
        decl="$(printf '%s' "$1" | sed -e 's/~/~~/g' -e "s/'/\\'/g")"
        >>"${file}" printf '%s' "while True:
            with open('${pyfifo}', 'r', 1) as f:
                for s in f:
                    try:
                        reply = line(s)
                    except Exception as e:
                        reply = 'echo -debug %~${decl} error: {}~; info "Python error"'.format(e)
                    with open('${kakfifo}', 'w') as r:
                        r.write(reply)"
        (python "${file}") >/dev/null 2>&1 </dev/null &
        pypid="$!"
        args="$(printf '%s' "$2" | sed -e 's/"/""/g')"
        printf '%s\n' "
            def -override $1 %{
                echo -to-file ${pyfifo} \"${args}\"
                eval %sh{ cat ${kakfifo} }
            }
            hook -group pydef global KakEnd .* %{
                nop %sh{
                    kill ${pypid}
                    rm -f ${file} ${pyfifo} ${kakfifo}
                }
            }
        "
    }
}

def xsel-copy %{
    exec %{<a-|>xsel -ib<ret>: echo -markup '{Information}yanked selection to system clipboard'<ret>}
}

pydef-debug 'xsel-paste-debug -params 2' %{
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

# NOTE: Don't use xclip. It's really buggy.
# NOTE: Python code must be indented like this.
pydef 'xsel-paste -params 2' '%arg{1}^%arg{2}' %{
    import os
    import re
    import sys

    def escape(s):
        s = re.sub("'", "''", s)
        s = re.sub("<", "<lt>", s)
        s = re.sub("(?<!<lt)>", "<gt>", s)
        return s

    position, select = stdin.strip().split('^')

    if not position in ["after", "before"]:
        return f"info -title 'xsel-paste error' -markup '{{Error}}Invalid position `{position}`, must be either `after` or `before`'"
    if not select in ["true", "false"]:
        return f"info -title 'xsel-paste error' -markup '{{Error}}Invalid select `{select}`, must be either `true` or `false`'"
    else:
        select = select == "true"

    content = escape(os.popen('xsel -ob').read())

    if content.endswith("\n"):
        prefix = "o" if position == "after" else "O"
        switches = "-draft" if not select else ""
        suffix = "x" if select else ""
        return f"execute-keys {switches} '{prefix}{content.rstrip()}<esc>{suffix}'"
    if not select:
        switches = "-draft"
        prefix = "li" if position == "after" else "i"
        suffix = ""
    else:
        switches = ""
        prefix = "a" if position == "after" else "ha"
        suffix = "i<esc>La<esc>"
    return f"execute-keys {switches} '{prefix}{content}<esc>{suffix}'"
}

def sudo-write -docstring 'write the content of the buffer using sudo' %{
    eval %sh{
        printf '%s\n' "info '${kak_buffile}'"
    }
}

# def fzf-buflist %{
#     eval %sh{
#         buflist="$(echo "${kak_buflist}" | sed -e "s/'/\\'/g" -e 's/ /\n/g')"
#         tmux split-window -v -l 20 "sh -c \"echo \\\"eval -client '${kak_client}' 'b \\\$(echo -e '${buflist}' | fzf)'\\\" | kak -p '${kak_session}'\"" &
#     }
# }

