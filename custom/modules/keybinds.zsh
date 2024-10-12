#!/usr/bin/env zsh
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^H" backward-kill-word
bindkey ";5~" kill-word
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "^[" vi-forward-char
