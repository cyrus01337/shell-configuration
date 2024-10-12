#!/usr/bin/env bash
export DENO_INSTALL="$HOME/.deno"

if which deno &> /dev/null || [[ -d $DENO_INSTALL ]]; then
    export PATH="$DENO_INSTALL/bin:$PATH"
fi
