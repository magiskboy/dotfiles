#!/bin/bash

GOROOT=$HOME/.local/go
GOVERSION=1.19.4

if [[ ! -d $GOROOT ]]; then
    echo "Installing go ${GOVERSION}"
    curl -L https://go.dev/dl/go${GOVERSION}.linux-amd64.tar.gz | tar -xz
    mv go $GOROOT
    ln -sf $GOROOT/bin/* $HOME/.local/bin
fi
