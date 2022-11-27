# Setup arch

The first thing is making the first steps from Arch Install Documentation, like setup the keyboard mapping, create the partitions, etc.
You also need verify the signature.

	loadkeys la-latin1 
	pacman -Sy	

You need to confirm before you have an internet access.
	
	iplink
	ping archlinux.org

If all is working well, you can continue. Now you need to update the system clock.

	timedatectl status

Now, you must check what SDD/HDD is going to be installed the S.O. In my case I'm going to do a Dual Boot for having Arch linux & Windows 10.

	fdisk -l
	cfdisk /dev/sdx
	
The first above commando is going to show the available HDD/SSD and the second /dev/sdx where "x" you must change it for the disk of you election.
This configurations depends what do you want. In my case I use a /home partition and root partition.

![KRT](https://i.imgur.com/RqambFr.png)

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

