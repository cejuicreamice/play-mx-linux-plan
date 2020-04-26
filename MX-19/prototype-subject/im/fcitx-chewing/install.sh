#!/usr/bin/env bash


echo
echo "sudo apt-get install im-config fcitx fcitx-chewing fcitx-frontend-all fcitx-frontend-gtk2 fcitx-frontend-gtk3 fcitx-frontend-qt4 fcitx-frontend-qt5 fcitx-config-gtk fcitx-ui-classic fcitx-module-dbus "
sudo apt-get install im-config fcitx fcitx-chewing fcitx-frontend-all fcitx-frontend-gtk2 fcitx-frontend-gtk3 fcitx-frontend-qt4 fcitx-frontend-qt5 fcitx-config-gtk fcitx-ui-classic fcitx-module-dbus


echo
echo "im-config -n fcitx"
im-config -n fcitx


echo
echo "cat ~/.xinputrc"
cat ~/.xinputrc


echo
echo "mkdir -p $HOME/.config/fcitx"
mkdir -p "$HOME/.config/fcitx"

echo
echo "cp ./config/set/profile $HOME/.config/fcitx/profile"
cp "./config/set/profile" "$HOME/.config/fcitx/profile"
