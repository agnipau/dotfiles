#!/usr/bin/env fish

function fish_prompt
    env EXIT_CODE=$status CLICOLOR_FORCE=1 sprompt
end

