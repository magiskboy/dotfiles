#!/bin/bash

uv tool install pyright
uv tool install ruff

uv tool install clangd

go install golang.org/x/tools/gopls@latest

if [ "$(uname -m)" = "x86_64" ] && [ "$(uname)" = "Linux" ]; then
    curl https://releases.hashicorp.com/terraform-ls/0.39.0/terraform-ls_0.39.0_linux_amd64.zip
else
    curl https://releases.hashicorp.com/terraform-ls/0.39.0/terraform-ls_0.39.0_darwin_arm64.zip
fi

npm install -g typescript-language-server typescript

npm install -g yaml-language-server

rustup component add rust-analyzer

# json/css/html/eslint
npm i -g vscode-langservers-extracted
