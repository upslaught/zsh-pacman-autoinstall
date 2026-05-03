command_not_found_handler() {
    local cmd="$1"
    local pkg=$(pkgfile -b -q "$cmd" | awk -F/ '{print $NF}' | head -n 1)

    if [[ -n "$pkg" ]]; then
        print -P "Command %F{red}%B'$cmd'%b%f not found, but the package %F{green}%B'$pkg'%b%f provides it.%f"
        print -Pn "Would you like to install %F{green}%B'$pkg'%b%f and run it? (y/N) %f"

        if read -q; then
            echo
            if sudo pacman -S "$pkg"; then
                "$@"
                return $?
            fi
        else
            echo
            return 0
        fi
    else
        echo "zsh: command not found: $cmd" >&2
        return 127
    fi
}
