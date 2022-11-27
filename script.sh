#/!bin/bash

pacstrap -K /mnt base linux linux-firmware nano git
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/Mexico/General /etc/localtime
hwclock --systohc
git clone https://gitlab.com/carloscarrete.sc/arch-files
cd arch-files
mv ./locale.gen /etc/locale.gen
locale-gen
mv ./locale.conf /etc/locale.conf
mv ./vconsole.conf /etc/vconsole.conf
pacman -S grub efibootmgr os-prober ntfs-3g networkmanager network-manager-applet wireless_tools wpa_supplicant dialog mtools dosfstools base-devel linux-headers git bluez bluez-utils pulseaudio-bluetooth cups openssh
