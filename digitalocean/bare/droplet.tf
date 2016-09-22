variable "hostname" {}
variable "region" {}
variable "size" {}
variable "ssh_fingerprint" {}
variable "ssh_key_file" {}
variable "authorized_keys_file" {}

variable "image" {
	default = "debian-8-x64"
}

variable "user" {
	default = "peter"
}

variable "private_networking" {
	default = "true"
}

resource "digitalocean_droplet" "droplet" {
	image = "${var.image}"
	name = "${var.hostname}"
	region = "${var.region}"
	size = "${var.size}"
	private_networking = "${var.private_networking}"
	ssh_keys = ["${var.ssh_fingerprint}"]

	connection {
		user = "root"
		key_file = "${var.ssh_key_file}"
	}

	provisioner "remote-exec" {
		inline = [
			# apt-get
			"echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_8.0/ /' > /etc/apt/sources.list.d/fish.list",
			"apt-get -qq update",
			"apt-get -qq install -y --force-yes sudo make vim git mercurial mosh fish curl wget unzip htop jq binutils gcc libpcap-dev runit",

			# locale-gen, for mosh
			"echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen", # >:|
			"locale-gen",

			# Go
			"wget https://storage.googleapis.com/golang/go1.7.1.linux-amd64.tar.gz",
			"tar -C /usr/local -xzf go1.7.1.linux-amd64.tar.gz",
			"rm go1.7.1.linux-amd64.tar.gz",

			# sudo permissions and add user
			"sed -i.bak 's/sudo\tALL=(ALL:ALL) ALL/sudo\tALL=(ALL:ALL) NOPASSWD: ALL/g' /etc/sudoers",
			"adduser --shell /usr/bin/fish --ingroup sudo --disabled-password --gecos '' ${var.user}",
			"mkdir -p /home/${var.user}/.ssh",
			"chown ${var.user}:sudo /home/${var.user}/.ssh",
		]
	}

	provisioner "file" {
		source = "${var.authorized_keys_file}"
		destination = "/home/${var.user}/.ssh/authorized_keys"
	}

	provisioner "remote-exec" {
		connection {
			user = "${var.user}"
			key_file = "${var.ssh_key_file}"
		}
		inline = [
			# Dotfiles
			"mkdir -p $HOME/src/github.com/peterbourgon",
			"cd $HOME/src/github.com/peterbourgon",
			"rm -rf cfg", # idempotent
			"git clone https://github.com/peterbourgon/cfg",
			"cd cfg",
			"sh -c 'rm -rf /home/${var.user}/.config ; ./SETUP.bash'",
		]
	}

	provisioner "remote-exec" {
		connection {
			user = "${var.user}",
			key_file = "${var.ssh_key_file}",
		}
		inline = [
			# Go programs
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
	value = "${digitalocean_droplet.droplet.ipv4_address}"
}
