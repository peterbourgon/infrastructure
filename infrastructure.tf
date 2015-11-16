variable "do_token" {}

provider "digitalocean" {
	token = "${var.do_token}"
}

variable "cloudflare_email" {}
variable "cloudflare_token" {}

provider "cloudflare" {
	email = "${var.cloudflare_email}"
	token = "${var.cloudflare_token}"
}

variable "ssh_fingerprint" {}
variable "ssh_key_file" {}
variable "authorized_keys_file" {}

module "husserl_host" {
	source = "./digitalocean"
	hostname = "husserl"
	region = "ams3"
	size = "4gb"
	ssh_fingerprint = "${var.ssh_fingerprint}"
	ssh_key_file = "${var.ssh_key_file}"
	authorized_keys_file = "${var.authorized_keys_file}"
}

variable "cloudflare_domain" {}

module "husserl_dns" {
	source = "./cloudflare"
	cloudflare_domain = "${var.cloudflare_domain}"
	cloudflare_name = "husserl"
	cloudflare_value = "${module.husserl_host.ip}"
}

#module "chomsky_host" {
#	source = "./digitalocean"
#	hostname = "chomsky"
#	region = "nyc3"
#	size = "4gb"
#	ssh_fingerprint = "${var.ssh_fingerprint}"
#	ssh_key_file = "${var.ssh_key_file}"
#	authorized_keys_file = "${var.authorized_keys_file}"
#}
#
#module "chomsky_dns" {
#	source = "./cloudflare"
#	cloudflare_domain = "${var.cloudflare_domain}"
#	cloudflare_name = "chomsky"
#	cloudflare_value = "${module.chomsky_host.ip}"
#}

