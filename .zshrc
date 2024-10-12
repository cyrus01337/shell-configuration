#!/usr/bin/env bash
setopt APPEND_HISTORY
setopt AUTO_CD
setopt COMPLETE_ALIASES
setopt COMPLETE_IN_WORD
setopt CORRECT
setopt DOT_GLOB
setopt EXTENDED_GLOB
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY
setopt NO_BG_NICE
setopt NO_BEEP
setopt NULL_GLOB
setopt SHARE_HISTORY
setopt +o NO_MATCH

COMPLETION_WAITING_DOTS=true
DISABLE_AUTO_TITLE=true
DISABLE_AUTO_UPDATE=true
DISABLE_MAGIC_FUNCTIONS=false
DISABLE_UNTRACKED_FILES_DIRTY=true
HISTDUP="erase"
HISTFILE="$ZDOTDIR/.zhistory"
WORDCHARS=${WORDCHARS//[\/]}
fpath+=("$ZDOTDIR/.zcompletions")

export EDITOR="nvim"
export GNUPGHOME="$HOME/.local/gnupg"
export HISTORY_FILTER_EXCLUDE=("_KEY" "Bearer" "@git")
export INPUTRC="$HOME/.inputrc"
export LANG="en_GB.UTF-8"
export LANGUAGE="en_GB:en"
export PASSWORD_STORE_DIR="$HOME/.local/password-store"
export VISUAL="micro"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_DIRS="/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share:/usr/share/ubuntu:/usr/share/gnome:/usr/local/share/:/usr/share/:$XDG_DATA_DIRS"
export XDG_DATA_HOME="$HOME/.local/share"

if [[ ! $PATH_EXTENDED ]]; then
    PATH_EXTENDED=true
    export PATH="$PATH:$HOME/.local/bin:$HOME/bin:$HOME/bin/custom:/usr/local/bin:/usr/local/go/bin:/snap/bin"
fi

zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"

. $ZDOTDIR/init.zsh
