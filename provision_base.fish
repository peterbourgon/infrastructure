#!/usr/bin/env fish

set host $argv[1]

scp root.sh root@$host:
ssh root@$host -- ./root.sh
ssh root@$host -- chsh -s /usr/bin/fish pb # extra-sure

scp user1.sh user2.sh pb@$host:
ssh -A pb@$host -- ./user1.sh
ssh -A pb@$host -- ./user2.sh

echo remember to disable root login

