#/!bin/bash
#Colors
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White

#Hostname
echo -e "${BIPurple} Now is starting the script..."
sleep 5
read -p "Type your desired name for the hostname: " hostname

#Basic Configuration
echo -e "${BIPurple} Now is starting basic configuration..."
sleep 5
ln -sf /usr/share/zoneinfo/Mexico/General /etc/localtime
hwclock --systohc
git clone https://gitlab.com/carloscarrete.sc/arch-files
cd arch-files
mv ./locale.gen /etc/locale.gen
locale-gen
mv ./locale.conf /etc/locale.conf
mv ./vconsole.conf /etc/vconsole.conf
echo $hostname >> /etc/hostname

#Internet and Dual Boot
echo -e "${BIPurple} Now is starting Dual Boot and Internet configuration..."
sleep 5
pacman -S grub efibootmgr os-prober ntfs-3g dialog mtools dosfstools base-devel linux-headers networkmanager network-manager-applet wireless_tools --noconfirm
systemctl enable NetworkManager

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
mv ./grub /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

echo -e "${BIPurple} Now you need type your desired name and password..."
sleep 5
read -p "Type your username: " username
useradd -mG wheel username
passwd $username
EDITOR=nano visudo

echo -e "${BIPurple} Now you must type your password for root..."
sleep 5
passwd
echo "All is done...Now you can type exit command and then type umount -a for finishing the installation"

