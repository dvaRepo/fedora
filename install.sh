#!/bin/bash
for i in `cat packages.txt` ; do sudo dnf -y install $i; done

user=$(whoami)
DIR="/home/$user/suckless"
if [ ! -d "$DIR" ]; then
  mkdir "$DIR"
else
  echo "${DIR} already exists"
fi

cd $DIR
git clone https://git.suckless.org/dwm
git clone https://git.suckless.org/st
git clone https://git.suckless.org/dmenu
git clone https://git.suckless.org/slock

git clone https://github.com/bakkeby/dwm-flexipatch.git

git clone https://github.com/yshui/picom.git
cd picom
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install

cd
