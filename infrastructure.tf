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

variable "cloudflare_domain" {}

module "archimedes_host" {
	source = "./digitalocean"
	hostname = "archimedes"
	region = "nyc3"
	size = "512mb"
	ssh_fingerprint = "${var.ssh_fingerprint}"
	ssh_key_file = "${var.ssh_key_file}"
	authorized_keys_file = "${var.authorized_keys_file}"
}
module "archimedes_dns" {
	source = "./cloudflare"
	cloudflare_domain = "${var.cloudflare_domain}"
	cloudflare_name = "archimedes"
	cloudflare_value = "${module.archimedes_host.ip}"
}

#module "husserl_host" {
#	source = "./digitalocean"
#	hostname = "husserl"
#	region = "ams3"
#	size = "4gb"
#	ssh_fingerprint = "${var.ssh_fingerprint}"
#	ssh_key_file = "${var.ssh_key_file}"
#	authorized_keys_file = "${var.authorized_keys_file}"
#}
#module "husserl_dns" {
#	source = "./cloudflare"
#	cloudflare_domain = "${var.cloudflare_domain}"
#	cloudflare_name = "husserl"
#	cloudflare_value = "${module.husserl_host.ip}"
#}

#module "chomsky_host" {
#	source = "./digitalocean"
#	hostname = "chomsky"
#	region = "nyc3"
#	size = "4gb"
#	ssh_fingerprint = "${var.ssh_fingerprint}"
#	ssh_key_file = "${var.ssh_key_file}"
#	authorized_keys_file = "${var.authorized_keys_file}"
#}
#module "chomsky_dns" {
#	source = "./cloudflare"
#	cloudflare_domain = "${var.cloudflare_domain}"
#	cloudflare_name = "chomsky"
#	cloudflare_value = "${module.chomsky_host.ip}"
#}

#module "k0_host" {
#	source = "./digitalocean"
#	hostname = "k0"
#	region = "ams3"
#	size = "1gb"
#	ssh_fingerprint = "${var.ssh_fingerprint}"
#	ssh_key_file = "${var.ssh_key_file}"
#	authorized_keys_file = "${var.authorized_keys_file}"
#}
#module "k0_dns" {
#	source = "./cloudflare"
#	cloudflare_domain = "${var.cloudflare_domain}"
#	cloudflare_name = "k0"
#	cloudflare_value = "${module.k0_host.ip}"
#}
#
#module "k1_host" {
#	source = "./digitalocean"
#	hostname = "k1"
#	region = "nyc3"
#	size = "1gb"
#	ssh_fingerprint = "${var.ssh_fingerprint}"
#	ssh_key_file = "${var.ssh_key_file}"
#	authorized_keys_file = "${var.authorized_keys_file}"
#}
#module "k1_dns" {
#	source = "./cloudflare"
#	cloudflare_domain = "${var.cloudflare_domain}"
#	cloudflare_name = "k1"
#	cloudflare_value = "${module.k1_host.ip}"
#}
#
#module "k2_host" {
#	source = "./digitalocean"
#	hostname = "k2"
#	region = "sfo1"
#	size = "1gb"
#	ssh_fingerprint = "${var.ssh_fingerprint}"
#	ssh_key_file = "${var.ssh_key_file}"
#	authorized_keys_file = "${var.authorized_keys_file}"
#}
#module "k2_dns" {
#	source = "./cloudflare"
#	cloudflare_domain = "${var.cloudflare_domain}"
#	cloudflare_name = "k2"
#	cloudflare_value = "${module.k2_host.ip}"
#}

