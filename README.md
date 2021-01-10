# Dotfiles
---

### How to install

```bash
$ ./install base
```

Hey,

This are my public dotfiles. They might not work for you, but feel free to steal from them.


#### Note

In linux, you must install ccls from [https://github.com/MaskRay/ccls](source code). Following code above:

```bash
$ sudo apt install clang cmake libclang-dev llvm-dev rapidjson-dev
$ cmake -H. -BRelease -DUSE_SYSTEM_RAPIDJSON=OFF
$ cmake --build Release
```


If you want install newest version neovim from [https://github.com/neovim/neovim](source), you follow tutorial above

```bash
$ sudo apt install gperf luajit luarocks libuv1-dev libluajit-5.1-dev libunibilium-dev libmsgpack-dev libtermkey-dev libvterm-dev libutf8proc-dev
$ sudo luarocks build mpack
$ sudo luarocks build lpeg
$ sudo luarocks build inspect
$ # Compile and build executable
$ make CMAKE_INSTALL_PREFIX=$HOME/.local CMAKE_BUILD_TYPE=RelWithDebInfo
$ make install
```
