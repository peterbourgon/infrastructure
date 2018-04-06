#!/usr/bin/env fish

set host $argv[1]

scp root.sh $host:
ssh $host -- sudo ./root.sh
ssh $host -- sudo chsh -s /usr/bin/fish pb # extra-sure
