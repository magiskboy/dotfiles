         _   _                                _  ___                  _____ _                 _
        | \ | | __ _ _   _ _   _  ___ _ __   | |/ / |__   __ _  ___  |_   _| |__   __ _ _ __ | |__
        |  \| |/ _` | | | | | | |/ _ \ '_ \  | ' /| '_ \ / _` |/ __|   | | | '_ \ / _` | '_ \| '_ \
        | |\  | (_| | |_| | |_| |  __/ | | | | . \| | | | (_| | (__    | | | | | | (_| | | | | | | |
        |_| \_|\__, |\__,_|\__, |\___|_| |_| |_|\_\_| |_|\__,_|\___|   |_| |_| |_|\__,_|_| |_|_| |_|
               |___/       |___/

# Dotfiles

Hey,

This are my public dotfiles. They might not work for you, but feel free to steal from them.

### Screenshot

<center>

![My prompt](https://firebasestorage.googleapis.com/v0/b/myblog-e552f.appspot.com/o/screenshot%2Fstarship_zsh.gif?alt=media&token=640a195d-db2a-4e73-8145-aa915c688f22)

![My editor](https://firebasestorage.googleapis.com/v0/b/myblog-e552f.appspot.com/o/screenshot%2Fneovim.gif?alt=media&token=f2629613-5de2-4a14-85ec-1d629cf8af23)

</center>

### Pre-requirement

In Ubuntu

```bash
$ sudo apt install git
```

In MacOS
```bash
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
$ brew install git
```

### How to install

```bash
$ git clone https://github.com/magiskboy/dotfiles $HOME/dotfiles
$ cd $HOME/dotfiles
$ ./install.sh base
```

### Install by hand

#### Pretty Rust tools
```sh
$ curl -fsSL https://starship.rs/install.sh | bash
$ cargo install git-delta exa bat zoxide
```

#### CPU and memory tracking in status bar tmux
```sh
$ git clone https://github.com/thewtex/tmux-mem-cpu-load $HOME/Development/tmux-mem-cpu-load && \
    cd $HOME/Development/tmux-mem-cpu-load
$ cmake . && make
$ sudo make install
```

#### docker-compose
```sh
$ curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" \
    -o $LOCAL/bin/docker-compose && chmod +x $LOCAL/bin/docker-compose
```
