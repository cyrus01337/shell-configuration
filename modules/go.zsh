#!/usr/bin/env zsh
export GOPATH="$HOME/.local/share/go"

if which go &> /dev/null || [[ -d "$GOPATH/go" ]]; then
    export PATH="/usr/local/go/bin:$GOPATH/bin:$HOME/.local/bin:$PATH"
fi
