provider "digitalocean" {
	token = "${var.do_token}"
}

variable "do_token" {}
variable "ssh_key_id" {}
variable "ssh_key_path" {}

resource "digitalocean_droplet" "dummy" {
	name = "dummy"
	image = "debian-8-x64"
	region = "ams3"
	size = "512mb"
	ssh_keys = ["${var.ssh_key_id}"]

	connection {
		user = "root"
		key_file = "${var.ssh_key_path}"
	}

	provisioner "remote-exec" {
		inline = [
			"echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_8.0/ /' > /etc/apt/sources.list.d/fish.list",
			"apt-get update",
			"apt-get install -y --force-yes sudo make vim git mercurial mosh fish curl wget unzip htop jq binutils",
			"echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen", # >:|
			"locale-gen",
			"wget https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz",
			"tar -C /usr/local -xzf go1.4.2.linux-amd64.tar.gz",
			"rm go1.4.2.linux-amd64.tar.gz",
			"adduser --shell /usr/bin/fish --ingroup sudo --disabled-password --gecos '' peter",
			"mkdir -p /home/peter/.ssh"
		]
	}

	provisioner "file" {
		source = "authorized_keys"
		destination = "/home/peter/.ssh/authorized_keys"
	}

	provisioner "remote-exec" {
		connection {
			user = "peter"
			key_file = "${var.ssh_key_path}"
		}
		inline = [
			"mkdir -p src/github.com/peterbourgon",
			"cd src/github.com/peterbourgon",
			"rm -rf cfg", # idempotent
			"git clone https://github.com/peterbourgon/cfg.git",
			"cd cfg",
			"sh -c 'rm -rf /home/peter/.config ; ./SETUP.bash'"
		]
	}
}

output "ip" {
	value = "${digitalocean_droplet.dummy.ipv4_address}"
}