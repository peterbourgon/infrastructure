variable "do_token" {}

provider "digitalocean" {
	token = "${var.do_token}"
}

variable "ssh_fingerprint" {}
variable "ssh_key_file" {}
variable "authorized_keys_file" {}

module "socrates" {
	source = "./digitalocean"
	hostname = "socrates"
	region = "ams3"
	size = "512mb"
	ssh_fingerprint = "${var.ssh_fingerprint}"
	ssh_key_file = "${var.ssh_key_file}"
	authorized_keys_file = "${var.authorized_keys_file}"
}
