variable "provision_core_packages" {
	default = [
		"echo installing core packages",
		"rm /etc/motd # it does not spark joy",
		"echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_9.0/ /' > /etc/apt/sources.list.d/fish.list",
		"wget -nv https://download.opensuse.org/repositories/shells:fish:release:2/Debian_9.0/Release.key -O Release.key >>/root/provisioning.log 2>&1",
		"apt-key add - < Release.key >>/root/provisioning.log 2>&1",
		"apt-get update >>/root/provisioning.log 2>&1",
		"apt-get install -y --force-yes sudo make vim git mercurial mosh fish curl wget unzip htop jq binutils gcc libpcap-dev runit >>/root/provisioning.log 2>&1",
	]
}

variable "provision_go" {
	default = [
		"echo installing Go",
		"wget https://storage.googleapis.com/golang/go1.9.2.linux-amd64.tar.gz >>/root/provisioning.log 2>&1",
		"tar -C /usr/local -xzf go1.9.2.linux-amd64.tar.gz >>/root/provisioning.log 2>&1",
		"rm go1.9.2.linux-amd64.tar.gz",
	]
}

variable "provision_peter" {
	default = [
		"echo setting up user peter",
		"sed -i.bak 's/sudo\tALL=(ALL:ALL) ALL/sudo\tALL=(ALL:ALL) NOPASSWD: ALL/g' /etc/sudoers",
		"adduser --shell /usr/bin/fish --ingroup sudo --disabled-password --gecos '' peter >>/root/provisioning.log 2>&1",
		"mkdir -p /home/peter/.ssh",
		"chown -R peter:sudo /home/peter/.ssh",
		"cp /root/.ssh/authorized_keys /home/peter/.ssh",
		"chown peter:sudo /home/peter/.ssh/authorized_keys",
	]
}

variable "provision_dotfiles" {
	default = [
		"echo installing dotfiles",
		"mkdir -p $HOME/src/github.com/peterbourgon",
		"cd $HOME/src/github.com/peterbourgon",
		"rm -rf dotfiles # idempotent",
		"git clone --quiet https://github.com/peterbourgon/dotfiles",
		"cd dotfiles",
		"./install.fish",
	]
}

variable "provision_programs" {
	default = [ 
		"echo installing some Go programs",
		"ssh-keyscan github.com >> $HOME/.ssh/known_hosts",
		"go get github.com/peterbourgon/grender",
		"go get github.com/peterbourgon/stats",
		"go get github.com/peterbourgon/sums",
	]
}
