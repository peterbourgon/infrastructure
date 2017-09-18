variable "hostname"             {}
variable "region"               {}
variable "size"                 {}
variable "ssh_fingerprint"      {}
variable "user"                 {}
variable "authorized_keys_file" {}

resource "digitalocean_droplet" "freebsd" {
	image    = "freebsd-11-1-x64"
	name     = "${var.hostname}"
	region   = "${var.region}"
	size     = "${var.size}"
	ssh_keys = ["${var.ssh_fingerprint}"]

	provisioner "remote-exec" {
		inline = [
			"echo installing core packages",
			"env PAGER=cat freebsd-update fetch # noninteractive",
			"freebsd-update install",
			"pkg install --yes shells/fish net/mosh git mercurial jq htop tree wget",

			"echo installing Go",
			"wget https://storage.googleapis.com/golang/go1.9.freebsd-amd64.tar.gz",
			"tar -C /usr/local -xzf go1.9.freebsd-amd64.tar.gz",
			"rm go1.9.freebsd-amd64.tar.gz",
			
			"echo setting up user ${var.user}",
			"echo ${var.user}::::::::/usr/local/bin/fish: | adduser -G wheel -f -",
			"echo '${var.user} ALL=(ALL) NOPASSWD: ALL' >> /usr/local/etc/sudoers",
			"mkdir -p /home/${var.user}/.ssh",
			"chown ${var.user} /home/${var.user}/.ssh",
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
			"git clone https://github.com/peterbourgon/dotfiles",
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
	value = "${digitalocean_droplet.freebsd.ipv4_address}"
}
