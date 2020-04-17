#!/bin/bash

pacman-key --init
pacman-key --populate

# Attempt to work around build failure on debian hosts.
mkdir -p /build/archiso/work/x86_64/airootfs/run/shm
mkdir -p /build/archiso/work/x86_64/airootfs/var/run/shm
mkdir -p /run/shm
mkdir -p /var/run/shm

set -e -u

sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

ln -sf /usr/share/zoneinfo/UTC /etc/localtime

usermod -s /usr/bin/zsh root
cp -aT /etc/skel/ /root/
chmod 700 /root

sed -i 's/#\(PermitRootLogin \).\+/\1yes/' /etc/ssh/sshd_config
sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist
sed -i 's/#\(Storage=\)auto/\1volatile/' /etc/systemd/journald.conf

sed -i 's/#\(HandleSuspendKey=\)suspend/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleHibernateKey=\)hibernate/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleLidSwitch=\)suspend/\1ignore/' /etc/systemd/logind.conf

groupadd frost
groupadd autologin
useradd -g frost -d /home/frost -m -s /bin/zsh  -G "autologin" frost
passwd -d frost
echo "frost ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers;

# Branding
sed -i.bak 's/Arch Linux/Frost OS/g' /usr/lib/os-release
sed -i.bak 's/arch/frost/g' /usr/lib/os-release
sed -i.bak 's#www.archlinux.org#github.com/chaitanyarahalkar/frostOS#g' /usr/lib/os-release
sed -i.bak 's#bbs.archlinux.org#github.com/chaitanyarahalkar/frostOS#g' /usr/lib/os-release
sed -i.bak 's#bugs.archlinux.org#github.com/chaitanyarahalkar/frostOS#g' /usr/lib/os-release

# Update locate database
updatedb 

# Start services 
systemctl enable pacman-init.service choose-mirror.service
systemctl enable sddm.service
systemctl enable graphical.target

# Enable the DHCP Daemon
systemctl enable dhcpd4.service

# Enable NTP Daemon
systemctl enable ntpd.service

# Enable Cron
systemctl enable cronie.service

systemctl set-default graphical.target
