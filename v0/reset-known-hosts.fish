#!/usr/bin/env fish

cat infrastructure.tf | grep "^module" | grep "_host" | awk '{print $2}' | tr -d '"' | sed -e 's/_host//' | while read host
	sed -i '' "/^$host.*/d" $HOME/.ssh/known_hosts
end
