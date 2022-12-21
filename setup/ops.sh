#!/bin/bash

source ./_utils.sh

install_if_unavailable docker k9s kubectl

DOCKER_CONFIG="$HOME/.docker"

sudo groupadd -f docker
sudo usermod -aG docker $USER

[[ ! -d $DOCKER_CONFIG ]] && mkdir -p $DOCKER_CONFIG

chown -R "$USER":"$USER" $DOCKER_CONFIG

chmod -R g+rwx $DOCKER_CONFIG

sudo systemctl restart docker
