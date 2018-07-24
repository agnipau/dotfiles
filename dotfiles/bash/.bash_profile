# .bash_profile
#
# Works with termux too.

SSH_ENV="${HOME}/.ssh/environment"

start_agent() {
  if [[ "$PREFIX" ]]; then
    "${PREFIX}/bin/ssh-agent" \
      | sed 's/^echo/#echo/' >"$SSH_ENV"
    chmod 600 "$SSH_ENV"
    . "$SSH_ENV" >/dev/null
    "${PREFIX}/bin/ssh-add"
  else
    /usr/bin/ssh-agent \
      | sed 's/^echo/#echo/' >"$SSH_ENV"
    chmod 600 "$SSH_ENV"
    . "$SSH_ENV" >/dev/null
    /usr/bin/ssh-add
  fi
}

if [[ -f "$SSH_ENV" ]]; then
  . "$SSH_ENV" >/dev/null
  ps -ef | grep "$SSH_AGENT_PID" \
         | grep ssh-agent >/dev/null \
	 || start_agent
else
  start_agent
fi

. "${HOME}/.bashrc"

[[ -z "$DISPLAY" && "$(tty)" == "/dev/tty1" && -z "$PREFIX" ]] && startx
