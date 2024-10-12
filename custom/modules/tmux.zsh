#!/usr/bin/env bash
if which tmux &> /dev/null && [[ ! "$TMUX" ]]; then
    tmux new-session -A -s main

    exit
fi
