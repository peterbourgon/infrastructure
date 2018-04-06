#!/usr/bin/env sh

echo installing core packages
rm /etc/motd # it does not spark joy
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_9.0/ /' > /etc/apt/sources.list.d/fish.list
wget -nv https://download.opensuse.org/repositories/shells:fish:release:2/Debian_9.0/Release.key -O Release.key
apt-key add - < Release.key
apt-get update
apt-get install -y --force-yes sudo make vim git mercurial fish curl wget unzip htop jq binutils gcc

echo installing Go
wget https://storage.googleapis.com/golang/go1.10.1.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.10.1.linux-amd64.tar.gz
rm go1.10.1.linux-amd64.tar.gz

echo setting up user pb
sed -i.bak 's/sudo\tALL=(ALL:ALL) ALL/sudo\tALL=(ALL:ALL) NOPASSWD: ALL/g' /etc/sudoers
adduser --shell /usr/bin/fish --ingroup sudo --disabled-password --gecos '' pb
mkdir -p /home/pb/.ssh
chown -R pb:sudo /home/pb/.ssh
cp .ssh/authorized_keys /home/pb/.ssh
chown pb:sudo /home/pb/.ssh/authorized_keys
