#!/usr/bin/env fish
if command -q git
    alias g="git"
    alias gb="git branch"
    alias gch="git checkout"
    alias gcl="git clone"
    alias gca="git commit --amend"
    alias gcn="git config"
    alias gco="git commit"
    alias gcog="git config --global"
    alias gd="git diff"
    alias gds="git diff --staged"
    alias gi="git init"
    alias gm="git merge"
    alias gr="git remote"
    alias gra="git remote add"
    alias gpl="git pull"
    alias gps="git push"
    alias gsm="git submodule"

    alias git-add-submodule "git submodule add"
    alias git-initialise-submodules "git submodule update --init --recursive"
    alias git-save-credentials "git config --global credential.helper store"
    alias git-update-submodule "git submodule update --remote --recursive --merge"
    alias gasm="git-add-submodule"
    alias gism="git-init-submodule"
    alias gusm="git-update-submodule"

    function ga --wraps "git add"
        set files $argv

        if not [ $files ]
            set files "."
        end

        git add $files
    end

    function gpsu --wraps "git push"
        set branch $argv[1]

        if not [ $branch ]
            set branch "main"
        end

        git push -u origin $branch
    end

    function fix-formatting-commit
        p format
        git add .
        git commit -m "Fix formatting"
        git push
    end

    function git-fetch-all-branches
        for remote in (git branch -r | grep -v '\->' | sed "s,\x1B\[[0-9;]*[a-zA-Z],,g")
            set trimmed_remote (string trim $remote)

            echo git branch --track (string replace -r -a "^\s*origin/" "" "$remote") "$trimmed_remote"
        end

        git fetch --all
        git pull --all
    end

    function git-submodule-remove
        set submodule $argv[1]

        git submodule deinit -f -- $submodule
        rm -rf .git/modules/$submodule
        git rm --cached $submodule
    end
end

if command -q gh
    function gh-repo-clone --wraps "gh repo clone"
        gh repo clone "git@github.com:$argv"
    end

    alias ghrc="gh-repo-clone"
end
