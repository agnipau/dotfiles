#!/usr/bin/env fish
#
# Start ssh-agent automatically.

if test -z $DISPLAY; and test (tty) = /dev/tty1; and test -z $PREFIX
  set -x SSH_ENV $HOME/.ssh/environment

  function start_agent
    ssh-agent -c | sed 's/^echo/#echo/' >$SSH_ENV
    chmod 600 $SSH_ENV
    . $SSH_ENV >/dev/null
    ssh-add
  end

  function test_identities
    ssh-add -l | grep "The agent has no identities" >/dev/null
    if test $status -eq 0
      ssh-add
      if test $status -eq 2
        start_agent
      end
    end
  end

  if test $SSH_AGENT_PID
    ps -ef | grep $SSH_AGENT_PID \
           | grep ssh-agent >/dev/null

    if test $status -eq 0
      test_identities
    end
  else
    if test -f $SSH_ENV
      . $SSH_ENV >/dev/null
    end

    ps -ef | grep $SSH_AGENT_PID \
           | grep -v grep \
           | grep ssh-agent >/dev/null

    if test $status -eq 0
      test_identities
    else
      start_agent
    end
  end

  # Run startx automatically if not in Termux and after login.
  test -z $DISPLAY;
    and test (tty) = /dev/tty1;
    and test -z $PREFIX;
    and startx
end
