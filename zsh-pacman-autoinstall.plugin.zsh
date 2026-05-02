command_not_found_handler() {
    local cmd="$1"
    local pkg=$(pkgfile -b -q "$cmd" | awk -F/ '{print $NF}' | head -n 1)

    if [[ -n "$pkg" ]]; then
        echo "Command '$cmd' not found, but the package '$pkg' provides it."

        if read -q "answer?Would you like to install '$pkg' and run it? (y/N) "; then
            if sudo pacman -S "$pkg"; then
                "$@"
                return $?
            fi
        fi
        return 0
    else
        echo "zsh: command not found: $cmd" >&2
        return 127
    fi
}
