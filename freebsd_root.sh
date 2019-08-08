#!/usr/bin/env tcsh

echo installing core packages
pkg update -f
pkg install -y fish git mercurial htop 

echo installing Go
setenv GOVERSION `curl -Ss 'https://golang.org/VERSION?m=text'`
wget -q https://storage.googleapis.com/golang/$GOVERSION.freebsd-amd64.tar.gz
tar -C /usr/local -xzf $GOVERSION.freebsd-amd64.tar.gz
rm $GOVERSION.freebsd-amd64.tar.gz

echo setting up user pb
sed -i.bak 's/^# %wheel ALL=(ALL) NOPASSWD: ALL$/%wheel ALL=(ALL) NOPASSWD: ALL/g' /usr/local/etc/sudoers
pw useradd pb -m -g wheel -s /usr/local/bin/fish -w no
mkdir -p /home/pb/.ssh
chown -R pb:wheel /home/pb/.ssh
cp .ssh/authorized_keys /home/pb/.ssh
chown pb:wheel /home/pb/.ssh/authorized_keys

echo disabling root SSH login
sed -i.bak 's/^PermitRootLogin .*$/PermitRootLogin no/' /etc/ssh/sshd_config
service sshd restart
