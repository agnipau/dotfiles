# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH="${PATH}:/home/agnipau/.cargo/bin"

eval "$(sprompt init -s bash -u -p)"

