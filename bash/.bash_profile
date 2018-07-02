#
# .bash_profile
#

# Source .bashrc
. ${HOME}/.bashrc

# Execute startx after logging into tty1
[[ -z $DISPLAY && "$(tty)" == "/dev/tty1" ]] && startx
