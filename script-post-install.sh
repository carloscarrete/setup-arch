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
echo -e "${BIGreen} Now the elemental apps are going to be installed..."
sleep 5
sudo pacman -S git bluez bluez-utils pulseaudio-bluetooth cups openssh \
wpa_supplicant dialog mtools dosfstools linux-headers \
base-devel flameshot

#Configuration
echo -e "${BIGreen} Now the configuration for the system is going to be configured..."
sleep 5
sudo systemctl enable bluetooth
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

echo -e "${BIGreen} Now started my custom settings..."
sleep 5

yay -S polybar pacman-contrib ttf-font-awesome \
siji-git pulseaudio alsa-utils betterlockscreen \
xdpyinfo xrandr bc nemo

cd ../..
mkdir .config
cp ./config/.xinitrc .
cp ./config/ .config -r

echo -e "${BIPurple} Done..."
sleep 5