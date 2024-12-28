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
        alias pa "npm install"
        alias pad "npm install --save-dev"
        alias pci "npm ci"
        alias pi "npm install"
        alias px "npx"
    else if [ -f "bun.lockb" ]
        alias p "bun"
        alias pa "bun add"
        alias pad "bun add --dev"
        alias pci "bun install --frozen-lockfile"
        alias pi "bun install"
        alias px "bunx"
    else
        return 127
    end

    return 0
end

function p_teardown
    functions --erase p pa pad pci pi px

    return 0
end
