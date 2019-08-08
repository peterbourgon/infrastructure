#!/usr/bin/env fish

set host $argv[1]

scp linux_root.sh root@$host:
ssh root@$host -- ./linux_root.sh

scp user1.sh user2.sh pb@$host:
ssh -A pb@$host -- ./user1.sh
ssh -A pb@$host -- ./user2.sh

