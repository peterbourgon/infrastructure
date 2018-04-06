#!/usr/bin/env fish

set host $argv[1]

scp user1.sh pb@$host:
ssh pb@$host -- ./user1.sh

scp user2.sh pb@$host:
ssh pb@$host -- ./user2.sh
