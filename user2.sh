#!/usr/bin/env sh

echo installing some Go programs
go get github.com/peterbourgon/grender
go get github.com/peterbourgon/stats
go get github.com/peterbourgon/sums

echo cleaning up
rm user1.sh user2.sh
