#!/usr/bin/env sh

echo setting up staging directory
rm -rf caddy
mkdir caddy
cd caddy

echo downloading caddy
wget -q -O caddy.tgz 'https://caddyserver.com/download/linux/amd64?plugins=tls.dns.digitalocean&license=personal&telemetry=off'
tar zxf caddy.tgz

echo putting caddy in place
sudo cp caddy /usr/local/bin
sudo chown root:root /usr/local/bin/caddy
sudo chmod 755 /usr/local/bin/caddy

echo setting capabilities
sudo setcap 'cap_net_bind_service=+ep' /usr/local/bin/caddy

# www-data already exists
#sudo groupadd -g 33 www-data
#sudo useradd \
#  -g www-data --no-user-group \
#  --home-dir /var/www --no-create-home \
#  --shell /usr/sbin/nologin \
#  --system --uid 33 www-data

echo setting up /etc directories
sudo rm -rf /etc/caddy /etc/ssl/caddy
sudo mkdir /etc/caddy
sudo chown -R root:root /etc/caddy
sudo mkdir /etc/ssl/caddy
sudo chown -R root:www-data /etc/ssl/caddy
sudo chmod 0770 /etc/ssl/caddy


echo installing Caddyfile
sudo mv ../Caddyfile /etc/caddy/
sudo chown root:root /etc/caddy/Caddyfile
sudo chmod 644 /etc/caddy/Caddyfile

echo creating /var/www
sudo rm -rf /var/www
sudo mkdir /var/www
sudo chown www-data:www-data /var/www
sudo chmod 555 /var/www

echo creating default websites
sudo mkdir /var/www/08d2.com
sudo chown www-data:www-data /var/www/08d2.com
sudo chmod 555 /var/www/08d2.com
sudo cp ../blank.index.html /var/www/08d2.com/index.html
sudo chown www-data:www-data /var/www/08d2.com/index.html

sudo mkdir /var/www/00.08d2.com
sudo chown www-data:www-data /var/www/00.08d2.com
sudo chmod 555 /var/www/00.08d2.com
sudo cp ../blank.index.html /var/www/00.08d2.com/index.html
sudo chown www-data:www-data /var/www/00.08d2.com/index.html

rm ../blank.index.html

echo installing DigitalOcean token in caddy.service file
sed -i "s/DIGITALOCEAN_TOKEN_SECRET/$(cat ../digitalocean_token.secret)/g" ../caddy.service
rm ../digitalocean_token.secret

echo setting up systemd service
sudo mv ../caddy.service /etc/systemd/system/
sudo chown root:root /etc/systemd/system/caddy.service
sudo chmod 644 /etc/systemd/system/caddy.service
sudo systemctl daemon-reload
sudo systemctl start caddy.service
sudo systemctl enable caddy.service

echo cleaning up
cd ../
rm -rf caddy

