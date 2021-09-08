#!/usr/bin/env fish

set host $argv[1]

scp root_freebsd.sh root@$host:
ssh root@$host -- ./root_freebsd.sh

scp user1.sh user2.sh pb@$host:
ssh -A pb@$host -- ./user1.sh
ssh -A pb@$host -- ./user2.sh
