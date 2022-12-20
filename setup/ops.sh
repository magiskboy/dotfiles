#!/bin/bash

source ./_utils.sh

pkgs=$(install_if_unavailable docker k9s kubectl)

if [[ $pkgs -ne "" ]];
    echo "Installing $pkgs"
    sudo pacman -S --noconfirm $pkgs 1>/dev/null

    if [[ $? -ne 0 ]]; then
        echo "Ops installation is failure"
        exit -1 
    fi
fi

DOCKER_CONFIG="$HOME/.docker"

groupadd -f docker && \
usermod -aG docker $USER && \

[[ ! -d $DOCKER_CONFIG ]] && mkdir -p $DOCKER_CONFIG && \
chown "$USER":"$USER" $DOCKER_CONFIG -R && \
chmod g+rwx $DOCKER_CONFIG -R && \
systemctl restart docker
