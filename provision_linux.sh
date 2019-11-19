#!/usr/bin/env fish

set host $argv[1]

scp root_linux.sh root@$host:
ssh root@$host -- ./root_linux.sh

ps aux | grep cm-root@$host | grep -v grep | awk '{print $2}' | xargs kill

scp user1.sh user2.sh pb@$host:
ssh -A -o "ControlMaster no" -o "ControlPersist no" pb@$host -- ./user1.sh
ssh -A -o "ControlMaster no" -o "ControlPersist no" pb@$host -- ./user2.sh

