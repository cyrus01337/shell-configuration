#!/usr/bin/env bash
if [[ "$XDG_SESSION_TYPE" = "x11" ]] && which xclip &> /dev/null; then
    alias clip="xclip -selection clipboard"
elif [[ "$XDG_SESSION_TYPE" = "wayland" ]] && which wl-copy &> /dev/null; then
    alias clip="wl-copy"
fi

