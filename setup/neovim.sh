#!/bin/bash

if [[ ! -d $HOME/.local/nvim-linux64 ]]; then
    echo "Installing neovim..."
    curl -L https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz | tar -xz 1>/dev/null
    mv nvim-linux64 $HOME/.local
    ln -sf $HOME/.local/nvim-linux64/bin/nvim $HOME/.local/bin/nvim
fi

PACKER_DIR="$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"

if [[ ! -d $PACKER_DIR ]]; then
    echo "Installing packer.nvim..."
    git clone https://github.com/wbthomason/packer.nvim $PACKER_DIR 1>/dev/null
fi

rm -rf $HOME/.vimrc && ln -sf `pwd`/vimrc $HOME/.vimrc

# setting up neovim

echo "Installing python dependencies..."
python -m pip install black isort pylint jedi pynvim 1>/dev/null
echo "Installing nodejs dependencies..."
npm install -g neovim typescript-language-server diagnostic-languageserver eslint_d @fsouza/prettierd typescript yarn yaml-language-server 1>/dev/null

# nvim --headless +PackerInstall +TSInstall all +qa!
