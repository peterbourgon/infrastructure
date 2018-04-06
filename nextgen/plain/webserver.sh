#!/usr/bin/env sh

mkdir -p /etc/http-proxy
mv proxy.conf /etc/http-proxy

mkdir -p  /var/www/nextgen.bourgon.org
mv http-proxy.service /etc/systemd/system

wget --quiet https://github.com/peterbourgon/http-proxy/releases/download/v1.0.0/http-proxy-1.0.0-linux-amd64
chmod +x http-proxy-1.0.0-linux-amd64
mv http-proxy-1.0.0-linux-amd64 /usr/local/bin/http-proxy

rm -rf /var/www/nextgen.bourgon.org
git clone https://github.com/peterbourgon/peter-bourgon-org /var/www/nextgen.bourgon.org
cd /var/www/nextgen.bourgon.org && /home/pb/bin/grender

systemctl daemon-reload
systemctl restart http-proxy
systemctl status http-proxy
