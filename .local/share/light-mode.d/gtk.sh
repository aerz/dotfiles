#!/usr/bin/env sh

gsettings set org.gnome.desktop.interface color-scheme "prefer-light"
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita"
gsettings set org.gnome.desktop.interface icon-theme "Papirus"
# https://github.com/flatpak/xdg-desktop-portal/blob/d7a304a00697d7d608821253cd013f3b97ac0fb6/data/org.freedesktop.impl.portal.Settings.xml#L33-L45
# gsettings set org.freedesktop.appearance color-scheme "2" # 1 == Prefer Light
