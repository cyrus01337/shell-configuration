#!/usr/bin/env deno
set -x DENO_INSTALL "$HOME/.deno"

if which deno &> /dev/null; or [ -d $DENO_INSTALL ]
    fish_add_path "$DENO_INSTALL/bin"
end
