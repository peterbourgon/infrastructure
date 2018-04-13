#!/usr/bin/env fish

set host $argv[1]

# scp http-proxy.service proxy.conf webserver.sh server.key server.crt $host:
scp http-proxy.service proxy.conf webserver.sh origin.pem origin.key $host:
ssh $host -- sudo ./webserver.sh
