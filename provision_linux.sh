#!/usr/bin/env fish

set host $argv[1]

scp -o "ControlMaster no" -o "ControlPersist no" root_linux.sh root@$host:
ssh -o "ControlMaster no" -o "ControlPersist no" root@$host -- ./root_linux.sh
scp -o "ControlMaster no" -o "ControlPersist no" user1.sh user2.sh pb@$host:
ssh -o "ControlMaster no" -o "ControlPersist no" -A pb@$host -- ./user1.sh
ssh -o "ControlMaster no" -o "ControlPersist no" -A pb@$host -- ./user2.sh

