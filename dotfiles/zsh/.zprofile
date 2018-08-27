# .zprofile
#
# Works with Termux too.

# Automatically start ssh-agent.
SSH_ENV="${HOME}/.ssh/environment"

start_agent() {
  ssh-agent \
    | sed 's/^echo/#echo/' >"$SSH_ENV"
  chmod 600 "$SSH_ENV"
  . "$SSH_ENV" >/dev/null
  ssh-add
}

if [[ -f "$SSH_ENV" && -z "$TMUX" ]]; then
  . "$SSH_ENV" >/dev/null
  ps -ef | grep "$SSH_AGENT_PID" \
         | grep ssh-agent >/dev/null \
         || start_agent
elif [[ -z "$TMUX" ]]; then
  start_agent
fi

. "${HOME}/.zshrc"

# Run startx automatically if not in Termux and after login.
[[ -z "$DISPLAY" && "$(tty)" == "/dev/tty1" && -z "$PREFIX" ]] && startx
