#!/usr/bin/env fish

set host $argv[1]

scp nginx_letsencrypt.sh root@$host:
ssh root@$host -- ./nginx_letsencrypt.sh

