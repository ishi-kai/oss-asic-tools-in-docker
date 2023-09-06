#!/bin/bash

set -e
set -u

echo "[INFO] Installing misc. packages"
apt-get install -y \
        firefox \
        gedit \
        gnuplot \
        htop \
        hub \
        meld \
        nano \
        net-tools \
        nmap \
        novnc \
        openems \
        python3-openems \
        parallel \
        sudo \
        tigervnc-standalone-server \
        vim \
        vim-gtk3 \
        websockify \
        xfce4 \
        xfce4-terminal \
        xterm 

apt-get install -y \
        language-pack-ja 

# Remove light-locker and other power management stuff, otherwise VNC session locks up
apt purge -y light-locker pm-utils *screensaver*
apt autoremove -y

# FIXME rm /etc/xdg/autostart/polkit*
/bin/dbus-uuidgen > /etc/machine-id

## create index.html to forward automatically to `vnc_lite.html`
ln -s "$NO_VNC_HOME"/vnc_lite.html "$NO_VNC_HOME"/index.html
