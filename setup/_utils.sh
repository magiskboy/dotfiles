#!/bin/bash

search_pkg() {
    pacman -Q | sed "s|\(.*\) \(.*\)|\1|" | grep -Fx $@
}

install_if_unavailable() {
    pkgs=""
    for pkg in $@; do
        if [[ $(search_pkg $pkg) == "" ]]; then
            pkgs="$pkgs $pkg"
        fi
    done
    echo "$pkgs" | sed 's/^.//'
}
