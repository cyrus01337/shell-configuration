#!/usr/bin/env fish
# https://medium.com/@chantastic/p-525e68f17e56
set FILE (status --current-filename)
set P_DIRECTORY (dirname $FILE)
set PROJECT_LANGUAGE ""
set P_PACKAGE_MANAGER ""
set PX_COMMAND ""
set SUPPORTED_LANGUAGES "javascript"
set SUPPORTED_SYSTEM_PACKAGE_MANAGERS "apt-get"

function find_loader_from_list
    set loader_names $argv

    for name in $loader_names
        set loader_found "detect_$name"

        source "$P_DIRECTORY/loaders/$name.fish"

        set cached_status $status
        set executables ($loader_found)

        if [ $cached_status = 0 ]
            # TODO: Make the 1st argument a flag to determine whether the
            # command should be ran with sudo
            echo $language
            echo $executables[1]
            echo $executables[2]

            return 0
        end
    end

    return 127
end

function auto_detect_package_manager
    set payload (find_loader_from_list $SUPPORTED_LANGUAGES)

    if [ $status != 0 ]
        set payload (find_loader_from_list $SUPPORTED_SYSTEM_PACKAGE_MANAGERS)

        if [ $status != 0 ]
            return 127
        end
    end

    if [ $status = 0 ]
        set PROJECT_LANGUAGE $payload
        set P_PACKAGE_MANAGER "$payload[1]"
        set PX_COMMAND "$payload[2]"
    end

    return 0
end

function p
    set subcommand $argv[1]
    set arguments $argv[2..]

    if not [ $subcommand ]
        $P_PACKAGE_MANAGER
    else if [ $subcommand = "query" ]
        echo $P_PACKAGE_MANAGER $arguments
    else
        $P_PACKAGE_MANAGER $arguments
    end
end

function px
    set subcommand $argv[1]
    set arguments $argv[2..]

    if not [ $subcommand ]
        $PX_COMMAND
    else if [ $subcommand = "query" ]
        echo $PX_COMMAND $arguments
    else
        $PX_COMMAND $arguments
    end
end

function on_pwd_change --on-variable PWD
    auto_detect_package_manager
end

auto_detect_package_manager
