#!/bin/bash

# Select the default DISK /dev/sda
DISK="/dev/sda"

# It's going to show the available disk space
AVAILABLE_GB=$(df -BG $DISK | tail -1 | awk '{print $4}')
echo "Available space: $AVAILABLE_GB"

read -p "¿How many partitions do you want to make? " num_partitions
# Pedimos al usuario el tamaño de cada partición en GB
read -p "¿How many GB each partition will be? " size_gb

# Comprobamos si hay espacio suficiente para crear las particiones
if [ $AVAILABLE_GB -lt $((num_partitions*size_gb)) ]; then
  echo "There is not enough space on the disk to create partitions"
  exit 1
fi

# Creamos las particiones utilizando fdisk
for ((i=1;i<=$num_partitions;i++)); do
  fdisk $DISK <<EOF
n
p
$i

+$size_gb GB
w
EOF
done

# Mostramos un mensaje de éxito
echo "Partitions have been created successfully"