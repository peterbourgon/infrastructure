#!/usr/bin/env sh

echo installing gnupg
rm /etc/motd # it does not spark joy
apt-get update
apt-get install -y --assume-yes gnupg # required to apt-key add and not installed by default anymore??

echo adding fish shell mirror
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_10/ /' | sudo tee /etc/apt/sources.list.d/shells:fish:release:3.list
wget -q -nv https://download.opensuse.org/repositories/shells:fish:release:3/Debian_10/Release.key -O Release.key
cat Release.key | gpg --dearmor | tee /etc/apt/trusted.gpg.d/shells_fish_release_3.gpg > /dev/null

echo installing core packages
apt update
apt install -y --assume-yes sudo make vim git mercurial fish curl wget unzip htop jq binutils gcc libcap2-bin ripgrep rsync

echo installing Go
wget -q -nv "https://golang.org/VERSION?m=text" -O goversion.txt
export GOVERSION=$(cat goversion.txt)
wget -q https://storage.googleapis.com/golang/$GOVERSION.linux-amd64.tar.gz
tar -C /usr/local -xzf $GOVERSION.linux-amd64.tar.gz
rm $GOVERSION.linux-amd64.tar.gz

echo setting up user pb
sed -i.bak 's/sudo\tALL=(ALL:ALL) ALL/sudo\tALL=(ALL:ALL) NOPASSWD: ALL/g' /etc/sudoers
adduser --shell /usr/bin/fish --ingroup sudo --disabled-password --gecos '' pb
mkdir -p /home/pb/.ssh
chown -R pb:sudo /home/pb/.ssh
cp .ssh/authorized_keys /home/pb/.ssh
chown pb:sudo /home/pb/.ssh/authorized_keys

echo disabling root SSH login
sed -i.bak 's/^PermitRootLogin .*$/PermitRootLogin no/' /etc/ssh/sshd_config
systemctl restart sshd

echo cleaning up
rm root_linux.sh
