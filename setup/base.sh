#!/bin/bash

source ./_utils.sh

LOCAL=$HOME/.local
mkdir -p $LOCAL/bin

sudo pacman-db-upgrade

install_if_unavailable \ "
    pavucontrol \
    git \
    base-devel \
    ranger \
    w3m \
    blueman \
    dunst \
    rofi \
    polybar \
    lua \
    luarocks \
    rust \
    rustup \
    cargo \
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
    wireless-regdb \
"

which yay 1>/dev/null
if [[ $? != 0 ]]; then
    echo "Installing yay"
    git clone https://aur.archlinux.org/yay-bin.git /tmp/yay && \
    cd /tmp/yay && \
    makepkg -si && \
    cd -
fi
