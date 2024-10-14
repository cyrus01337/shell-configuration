#!/usr/bin/env zsh
if which tmux &> /dev/null && [[ ! "$TMUX" ]]; then
    tmux new-session -As main

    exit $?
fi
