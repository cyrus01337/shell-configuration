#!/usr/bin/env fish
set CARGO_PATH "$HOME/.cargo"

if [ -d $CARGO_PATH ]
    source "$CARGO_PATH/env.fish"
end

return 0
