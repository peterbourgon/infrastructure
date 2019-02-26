#!/usr/bin/env sh

echo installing nginx
apt-get install nginx

echo installing certbot
echo 'deb http://deb.debian.org/debian stretch-backports main' >> /etc/apt/sources.list.d/stretchbackports.list
apt-get upgrade
apt-get install certbot python-certbot-nginx -t stretch-backports

echo point initial DNS records to this box and press enter when complete
read x
sudo certbot --nginx

echo to add more domains later, sudo certbot --nginx -d sub.example.com,www.example.com,example.com
echo cleaning up
rm nginx_letsencrypt.sh
