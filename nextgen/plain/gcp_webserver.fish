#!/usr/bin/env fish

set host $argv[1]

scp http-proxy.service proxy.conf webserver.sh $host:
ssh $host -- sudo ./webserver.sh