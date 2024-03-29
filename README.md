         _   _                                _  ___                  _____ _                 _
        | \ | | __ _ _   _ _   _  ___ _ __   | |/ / |__   __ _  ___  |_   _| |__   __ _ _ __ | |__
        |  \| |/ _` | | | | | | |/ _ \ '_ \  | ' /| '_ \ / _` |/ __|   | | | '_ \ / _` | '_ \| '_ \
        | |\  | (_| | |_| | |_| |  __/ | | | | . \| | | | (_| | (__    | | | | | | (_| | | | | | | |
        |_| \_|\__, |\__,_|\__, |\___|_| |_| |_|\_\_| |_|\__,_|\___|   |_| |_| |_|\__,_|_| |_|_| |_|
               |___/       |___/

# Dotfiles

```
git clone --recurse-submodules -j8 git@github.com:magiskboy/dotfiles.git
```

Hey,

This are my public dotfiles. They might not work for you, but feel free to steal from them.

First, install base packages and link to dotfiles

```
./install.sh
```

### Post setup

Change default shell to zsh

```
sudo chsh -s $(which zsh)
```

Setup for python/javascript development and neovim

```
pyenv install 3.8.7
pyenv global 3.8.7
pip install poetry black isort pylint jedi pynvim
nvm use 16.13
sudo npm i -g neovim typescript-language-server diagnostic-languageserver eslint_d @fsouza/prettierd typescript yarn
```

Install some packages, which isn't available in apt repo

```
cargo install alacritty
```
