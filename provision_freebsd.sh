#!/usr/bin/env fish

set host $argv[1]

scp freebsd_root.sh root@$host:
ssh root@$host -- ./freebsd_root.sh
ssh root@$host -- chsh -s /usr/local/bin/fish pb

scp user1.sh user2.sh pb@$host:
ssh -A pb@$host -- ./user1.sh
ssh -A pb@$host -- ./user2.sh

echo remember to disable root SSH login

