#!/usr/bin/env fish

for host in (cat infrastructure.tf | grep "^module" | grep "_host" | awk '{print $2}' | tr -d '"' | sed -e 's/_host//')
	sed -i '' "/^$host.*/d" $HOME/.ssh/known_hosts
end
