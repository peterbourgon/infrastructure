resource "digitalocean_droplet" "default" {
	image    = "${var.image}"
	name     = "${var.name}"
	region   = "${var.region}"
	size     = "${var.size}"
	ssh_keys = ["${var.ssh_key_fingerprint}"]

	provisioner "remote-exec" {
		inline = "${var.root_provisioning}"
	}

	provisioner "remote-exec" {
		connection {
			user = "${var.user}"
		}
		inline = "${var.user_provisioning_one}"
	}

	provisioner "remote-exec" {
		connection {
			user = "${var.user}"
		}
		inline = "${var.user_provisioning_two}"
	}
}
