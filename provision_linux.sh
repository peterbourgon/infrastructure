#!/usr/bin/env fish

set host $argv[1]

scp root_linux.sh root@$host:
ssh root@$host -- ./root_linux.sh

scp user1.sh user2.sh pb@$host:
ssh -A pb@$host -- ./user1.sh
ssh -A pb@$host -- ./user2.sh

