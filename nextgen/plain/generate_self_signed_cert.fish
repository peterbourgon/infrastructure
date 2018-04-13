#!/usr/bin/env fish

# https://community.fastly.com/t/setting-up-self-signed-tls-in-fastly-and-my-origin/531

openssl genrsa -des3 -out server.key.secure 2048
openssl rsa -in server.key.secure -out server.key
openssl req -new -key server.key -out server.csr
openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt

