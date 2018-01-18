variable "hostname"             {}
variable "region"               {}
variable "size"                 {}
variable "ssh_fingerprint"      {}
variable "user"                 {}
variable "authorized_keys_file" {}

resource "digitalocean_droplet" "linux" {
	image    = "debian-9-x64"
	name     = "${var.hostname}"
	region   = "${var.region}"
	size     = "${var.size}"
	ssh_keys = ["${var.ssh_fingerprint}"]

	provisioner "remote-exec" {
		inline = [
			"echo installing core packages",
			"rm /etc/motd # it does not spark joy",
			"echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_9.0/ /' > /etc/apt/sources.list.d/fish.list",
			"wget -nv https://download.opensuse.org/repositories/shells:fish:release:2/Debian_9.0/Release.key -O Release.key >>/root/provisioning.log 2>&1",
			"apt-key add - < Release.key >>/root/provisioning.log 2>&1",
			"apt-get update >>/root/provisioning.log 2>&1",
			"apt-get install -y --force-yes sudo make vim git mercurial mosh fish curl wget unzip htop jq binutils gcc libpcap-dev >>/root/provisioning.log 2>&1",

			"echo installing Go",
			"wget https://storage.googleapis.com/golang/go1.9.2.linux-amd64.tar.gz >>/root/provisioning.log 2>&1",
			"tar -C /usr/local -xzf go1.9.2.linux-amd64.tar.gz >>/root/provisioning.log 2>&1",
			"rm go1.9.2.linux-amd64.tar.gz",
			
			"echo setting up user ${var.user}",
			"sed -i.bak 's/sudo\tALL=(ALL:ALL) ALL/sudo\tALL=(ALL:ALL) NOPASSWD: ALL/g' /etc/sudoers",
			"adduser --shell /usr/bin/fish --ingroup sudo --disabled-password --gecos '' ${var.user} >>/root/provisioning.log 2>&1",
			"mkdir -p /home/${var.user}/.ssh",
			"chown -R ${var.user}:sudo /home/${var.user}/.ssh",
		]
	}

	provisioner "file" {
		source      = "${var.authorized_keys_file}"
		destination = "/home/${var.user}/.ssh/authorized_keys"
	}

	provisioner "remote-exec" {
		connection {
			user  = "${var.user}"
			agent = true # default
		}
		inline = [
			"echo installing dotfiles",
			"mkdir -p $HOME/src/github.com/peterbourgon",
			"cd $HOME/src/github.com/peterbourgon",
			"rm -rf dotfiles # idempotent",
			"git clone --quiet https://github.com/peterbourgon/dotfiles",
			"cd dotfiles",
			"./install.fish",
		]
	}

	provisioner "remote-exec" {
		connection {
			user  = "${var.user}"
			agent = true # default
		}
		inline = [
			"echo installing some Go programs",
			"go get github.com/peterbourgon/grender",
			"go get github.com/peterbourgon/stats",
			"go get github.com/peterbourgon/sums",
		]
	}
	
}

output "hostname" {
	value = "${var.hostname}"
}

output "ip" {
	value = "${digitalocean_droplet.linux.ipv4_address}"
}
