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

#Elemental apps
sudo pacman -S git bluez bluez-utils pulseaudio-bluetooth cups openssh \
wpa_supplicant dialog mtools dosfstools linux-headers \
networkmanager network-manager-applet wireless_tools base-devel flameshot

#Configuration
sudo systemctl enable NetworkManager
sudo systemctl enable bluetooth
sudo systemctl enable org.cups.cupsd
sudo systemctl enable cups #if the above command doesn't works
sudo systemctl enable sshd

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

cd ../..
mkdir .config
cp ./config/.xinitrc .
cp ./config/ .config -r

yay -S polybar pacman-contrib ttf-font-awesome \
siji-git pulseaudio alsa-utils betterlockscreen \
xdpyinfo xrandr bc feh

