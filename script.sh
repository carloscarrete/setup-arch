#/!bin/bash
ln -sf /usr/share/zoneinfo/Mexico/General /etc/localtime
hwclock --systohc
git clone https://gitlab.com/carloscarrete.sc/arch-files
cd arch-files
mv ./locale.gen /etc/locale.gen
locale-gen
mv ./locale.conf /etc/locale.conf
mv ./vconsole.conf /etc/vconsole.conf
echo carlos >> /etc/hostname
pacman -S grub efibootmgr os-prober ntfs-3g dialog mtools dosfstools base-devel linux-headers git --noconfirm
