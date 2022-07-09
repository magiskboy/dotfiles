#!/bin/bash

LOCAL=$HOME/.local
[[ ! -d $LOCAL/bin ]] && mkdir $LOCAL/bin

sudo pacman -Sy --noconfirm

sudo pacman -S --noconfirm \
    git \
    base-devel \
    ripgrep \
    htop \
    fzf \
    pgcli \
    mycli \
    zsh \
    bat \
    jq \
    yq \
    tmux \
    docker.io \
    dunst \
    i3-gaps \
    i3status-rust \
    alsa-utils \
    wpa_supplicant \
    wireless_tools \
    amd-ucode \
    b43-fwcutter \
    base \
    bind \
    brltty \
    broadcom-wl \
    btrfs-progs \
    ddrescue \
    dhclient \
    dhcpcd \
    diffutils \
    dmidecode \
    dmraid \
    dnsmasq \
    dosfstools \
    e2fsprogs \
    edk2-shell \
    efibootmgr \
    espeakup \
    ethtool \
    exfatprogs \
    f2fs-tools \
    gnu-netcat \
    gpart \
    gptfdisk \
    grub \
    hdparm \
    hyperv \
    intel-ucode \
    ipw2100-fw \
    ipw2200-fw \
    iw \
    iwd \
    libusb-compat \
    linux \
    lvm2 \
    man-db \
    man-pages \
    memtest86+ \
    nmap \
    vpnc \
    openvpn \
    openconnect \
    openssh \
    qemu-guest-agent \
    rsync \
    rxvt-unicode-terminfo \
    syslinux \
    systemd-resolvconf \
    usb_modeswitch \
    usbmuxd \
    usbutils \
    virtualbox \
    virtualbox-guest-utils-nox \
    wireless-regdb

git clone https://aur.archlinux.org/yay-bin.git /tmp/yay && \
cd /tmp/yay && \
makepkg -si && \
cd -

DOCKER_CONFIG="$HOME/.docker"
groupadd -f docker && \
usermod -aG docker $USER && \
[[ ! -d $DOCKER_CONFIG ]] && mkdir -p $DOCKER_CONFIG && \
chown "$USER":"$USER" $DOCKER_CONFIG -R && \
chmod g+rwx $DOCKER_CONFIG -R && \
systemctl restart docker

# Link dotfiles
rm -rf $HOME/.zshrc $HOME/.oh-my-zsh $HOME/.zshrc $HOME/.zshenv $HOME/.zlogin $HOME/.zprofile && \
ln -sf `pwd`/oh-my-zsh $HOME/.oh-my-zsh && \
ln -sf `pwd`/zsh/zshrc $HOME/.zshrc && \
ln -sf `pwd`/zsh/zlogin $HOME/.zlogin && \
ln -sf `pwd`/zsh/zprofile $HOME/.zprofile && \
ln -sf `pwd`/zsh/zshenv $HOME/.zshenv && \
ln -sf `pwd`/zsh/zshrc $HOME/.zshrc && \

rm -rf $HOME/.bashrc && \
ln -sf $(pwd)/bashrc $HOME/.bashrc

ln -sf `pwd`/gitconfig $HOME/.gitconfig

git clone https://github.com/wbthomason/packer.nvim \
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

ln -sf `pwd`/vimrc $HOME/.vimrc

ln -sf `pwd`/pyenv $HOME/.pyenv

ln -sf `pwd`/nvm $HOME/.nvm

sudo mkdir -f /usr/share/fonts && \
sudo cp -R `pwd`/fonts /usr/share/fonts/Meslo
