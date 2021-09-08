#!/usr/bin/env sh

echo installing some Go programs
go install github.com/peterbourgon/grender@latest
go install github.com/peterbourgon/stats@latest
go install github.com/peterbourgon/sums@latest

echo cleaning up
rm user1.sh user2.sh
