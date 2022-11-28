# Setup arch
# Arch Install
The first thing is making the first steps from Arch Install Documentation, like setup the keyboard mapping, create the partitions, etc.
You also need verify the signature.

	loadkeys la-latin1 
	pacman -Sy	

You need to confirm before you have an internet access.
	
	iplink
	ping archlinux.org

If all is working well, you can continue. Now you need to update the system clock.

	timedatectl status

Now you can use reflector for sorting the reposity servers by velocity

	reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist

Now, you must check what SDD/HDD is going to be installed the S.O. In my case I'm going to do a Dual Boot for having Arch linux & Windows 10.

	fdisk -l
	cfdisk /dev/sdx
	
The first above commando is going to show the available HDD/SSD and the second /dev/sdx where "x" you must change it for the disk of you election.
This configurations depends what do you want. In my case I use a /home partition and root partition.

![enter image description here](https://i.imgur.com/129Rf7O.png)

Now you need to format and activate your swap is you choose it. You can use **fdisk -l** if you don't know what is your disk.

	mkfs.ext4 /dev/sd5   #Root Partition
	mkfs.ext4 /dev/sd6   #Home Partition

Then, if you want Dual Boot you need to create a new directory for having the EFI and another directory for having Windows and a Home Directory.

	mkdir /mnt/windows10
	mkdir /mnt/boot
	mkdir /mnt/home

Then you need to mount it

	mount /dev/sd5 /mnt #Root
	mount /dev/sd6 /mnt/home #Home
	mount /dev/sdx /mnt/boot #Dual Boot
	mount /dev/sdx /mnt/windows10 #Windows10

![enter image description here](https://i.imgur.com/foifBrK.png)

Now you can install Linux with pacstrap, also you can install aditionals programs like nano, git, etc.

	pacstrap -K /mnt base linux linux-firmware nano 

Now the next steps is following the documentation, I recommend you chek it only if someone has changed.
https://wiki.archlinux.org/title/Installation_guide_(Espa%C3%B1ol)

Generate a fstab
	
	genfstab -U /mnt >> /mnt/etc/fstab

You can check it if you have any error. You can edit it.

	/mnt/etc/fstab

Now you enter in the chroot mode.

	arch-chroot /mnt

Select your Time Zone. In my case this is that I use.

	ln -sf /usr/share/zoneinfo/Mexico/General /etc/localtime

Run hwclock for generating adjtime

	hwclock --systohc

Now for the lenguage you have to uncomment the language that you want in /etc/locale.gen.

	nano /etc/locale.gen

And then run the next command.

	locale-gen

Now you have to define the variable in /etc/locale.conf nad edit with the previous output like LANG=_es_MX.UTF-8_

	nano /etc/locale.conf

Next step is create a hotname in /etc/hostname and you onlye have to put your desired name 

	nano /etc/hostname

Now install the essential programs. In my case these are my programs.

	pacman -S grub efibootmgr os-prober ntfs-3g networkmanager network-manager-applet wireless_tools wpa_supplicant dialog mtools dosfstools base-devel linux-headers git bluez bluez-utils pulseaudio-bluetooth cups openssh
 
 Install and config grub if you have Dual Boot

	grub-install --target=x86_64-efi --efi-directory=/boot        --bootloader-id=GRUB
	grub-mkconfig - o /boot/grub/grub.cfg


Maybe you need to config some files for running grub with nano. 
If you have Windows it will not be appear in dual boot, it will appear after you reboot your computer

Now just enable all the services

	systemctl enable NetworkManager
	systemctl enable bluetooth
	systemctl enable org.cups.cupsd
	systemctl enable cups #if the above command doesn't works
	systemctl enable sshd

Now create your user and asign it a password.

	useradd -mG wheel nombreUsuario
	passwd nombreUsuario

After that you must do the next step.

	EDITOR=nano visudo (uncomment wheel all all)

Then you must asing a password to root

	passwd
Finally you need to run

	exit
	unmount -a
	reboot

