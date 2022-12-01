#!/bin/bash
#Colors
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White

#Initialize
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si PKGBUILD
yay -S ttf-ms-fonts
yay -S timeshift
sudo pacman -S \
xf86-video-intel xorg xorg-init \
bspwm sxhkd rofi nitrogen picom \
xfce4-terminal arandr chromium 