#!/usr/bin/env sh

echo github is OK
ssh-keyscan github.com >> $HOME/.ssh/known_hosts

echo installing dotfiles
mkdir -p $HOME/src/github.com/peterbourgon
cd $HOME/src/github.com/peterbourgon
rm -rf dotfiles # idempotent
git clone git@github.com:peterbourgon/dotfiles
cd dotfiles
./install.fish

