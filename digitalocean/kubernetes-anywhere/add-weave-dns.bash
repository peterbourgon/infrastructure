#!/usr/bin/env bash
IP=$(ifconfig docker0 | grep 'inet addr' | awk '{print $2}' | cut -d: -f2)
echo "nameserver $IP" | sudo tee -a /etc/resolvconf/resolv.conf.d/head
sudo resolvconf -u
cat /etc/resolv.conf
