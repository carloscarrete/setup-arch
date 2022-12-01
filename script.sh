#/!bin/bash
read -p "Introduzca el nombre del hostname deseado: " hostname
ln -sf /usr/share/zoneinfo/Mexico/General /etc/localtime
hwclock --systohc
git clone https://gitlab.com/carloscarrete.sc/arch-files
cd arch-files
mv ./locale.gen /etc/locale.gen
locale-gen
mv ./locale.conf /etc/locale.conf
mv ./vconsole.conf /etc/vconsole.conf
echo $hostname >> /etc/hostname
pacman -S grub efibootmgr os-prober ntfs-3g dialog mtools dosfstools base-devel linux-headers networkmanager network-manager-applet wireless_tools --noconfirm
systemctl enable NetworkManager

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
##TODO: Upload a new grub
grub-mkconfig -o /boot/grub/grub.cfg

read -p "Introduzca el nombre de usuario deseado: " username
useradd -mG wheel username
passwd $username
EDITOR=nano visudo

passwd
echo "Todo ha finalizado...Ahora puede ejecutar el comando exit y despuest umount -a para salir de la instalación"

