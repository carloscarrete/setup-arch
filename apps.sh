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

cmd=(dialog --separate-output --checklist "Select apps you want to install:" 22 76 16)
options=(A "Firefox" off   
         B "Brave" off
         C "Chrome" off
         D "LxAppareance" off
         E "VLC" off
         F "Telegram" off
         G "Insomnia" off
         H "MySQL Workbench" off
         I "MongoDB" off
         J "Filezilla" off
         K "GPicView (Visor de Imágenes)" off
         L "Gedit" off
         M "Feh" off
         N "Visual Studio Code" off
         )
choices=$("${cmd[@]}" "${options[@]}" 2>&1 > /dev/tty)
clear
for choice in $choices
do
    case $choice in
        A)
            echo -e "${BIGreen} Firefox installation has started..."
            sudo pacman -S 	firefox --noconfirm
            ;;
        B)
            echo -e "${BIGreen} Brave installation has started..."
            yay -S brave-nightly-bin --noconfirm
            ;;
        C)
            echo -e "${BIGreen} Chrome installation has started..."
            yay -S google-chrome --noconfirm
            ;;
        D)
            echo -e "${BIGreen} Lxappearance installation has started..."
            sudo pacman -S lxappearance --noconfirm
            ;;
        E)
            echo -e "${BIGreen} VLC installation has started..."
            sudo pacman -S vlc --noconfirm
            ;;
        F)
            echo -e "${BIGreen} Telegram installation has started..."
            sudo pacman -S 	telegram-desktop --noconfirm
            ;;
        G)
            echo -e "${BIGreen} Insomnia installation has started..."
            yay -S insomnia --noconfirm
            ;;
        H)
            echo -e "${BIGreen} MySQL Workbench installation has started..."
            sudo pacman -S mysql-workbench --noconfirm
            ;;
        I)
            echo -e "${BIGreen} MongoDB Compass installation has started..."
            yay -S mongodb-compass --noconfirm
            ;;
        J)
            echo -e "${BIGreen} Filezilla installation has started..."
            sudo pacman -S filezilla --noconfirm
            ;;
        K)
            echo -e "${BIGreen} Gpicview installation has started..."
            sudo pacman -S gpicview --noconfirm
            ;;
        L)
            echo -e "${BIGreen} Gedit installation has started..."
            sudo pacman -S gedit --noconfirm
            ;;
        M)
            echo -e "${BIGreen} Feh installation has started..."
            sudo pacman -S feh --noconfirm
            ;;
        M)
            echo -e "${BIGreen} Visual Studio Code installation has started..."
            yay -S visual-studio-code-bin  --noconfirm
            ;;
    esac

done
echo -e "${BIYellow} ........................................................................"
echo -e "${BICyan} All apps has been installed"
