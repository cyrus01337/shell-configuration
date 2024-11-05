#!/usr/bin/env fish
function p_detect
    if begin
        [ -f "package-lock.json" ]
        or [ -f "yarn.lock" ]
        or [ -f "pnpm-lock.yaml" ]
        or [ -f "deno.lock" ]
        or [ -f "bun.lockb" ]
    end
        return 0
    end

    return 127
end

function p_setup
    if [ -f "package-lock.json" ]
        alias p "npm"
        alias pi "npm install"
        alias px "npx"
    else
        return 127
    end

    return 0
end

function p_teardown
    functions --erase p pi px

    return 0
end
