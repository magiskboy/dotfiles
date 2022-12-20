#!/bin/bash

which neovim 1>/dev/null

if [[ $? != 0 ]]; the
    curl -L https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz | tar -xz
fi

PACKER_DIR="~/.local/share/nvim/site/pack/packer/start/packer.nvim"

[[ ! -d $PACKER_DIR ]] && git clone https://github.com/wbthomason/packer.nvim $PACKER_DIR

rm -rf $HOME/.vimrc && ln -sf `pwd`/vimrc $HOME/.vimrc

# setting up neovim

pip install poetry black isort pylint jedi pynvim
npm install -g neovim typescript-language-server diagnostic-languageserver eslint_d @fsouza/prettierd typescript yarn yaml-language-server

# nvim --headless +PackerInstall +TSInstall all +qa!
