#!/usr/bin/env fish

if test ! -f digitalocean_token.secret
	echo create digitalocean_token.secret
	exit
end

set host $argv[1]

scp caddy.sh Caddyfile caddy.service blank.index.html digitalocean_token.secret pb@$host:
ssh pb@$host -- ./caddy.sh

