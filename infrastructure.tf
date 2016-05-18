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

#module "archimedes_host" {
#	source = "./digitalocean"
#	hostname = "archimedes"
#	region = "nyc3"
#	size = "512mb"
#	ssh_fingerprint = "${var.ssh_fingerprint}"
#	ssh_key_file = "${var.ssh_key_file}"
#	authorized_keys_file = "${var.authorized_keys_file}"
#}
#module "archimedes_dns" {
#	source = "./cloudflare"
#	cloudflare_domain = "${var.cloudflare_domain}"
#	cloudflare_name = "archimedes"
#	cloudflare_value = "${module.archimedes_host.ip}"
#}

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

#module "a_host" {
#	source = "./digitalocean"
#	hostname = "a"
#	region = "ams3"
#	size = "4gb"
#	ssh_fingerprint = "${var.ssh_fingerprint}"
#	ssh_key_file = "${var.ssh_key_file}"
#	authorized_keys_file = "${var.authorized_keys_file}"
#}
#module "a_dns" {
#	source = "./cloudflare"
#	cloudflare_domain = "${var.cloudflare_domain}"
#	cloudflare_name = "a"
#	cloudflare_value = "${module.a_host.ip}"
#}
#module "b_host" {
#	source = "./digitalocean"
#	hostname = "b"
#	region = "ams3"
#	size = "4gb"
#	ssh_fingerprint = "${var.ssh_fingerprint}"
#	ssh_key_file = "${var.ssh_key_file}"
#	authorized_keys_file = "${var.authorized_keys_file}"
#}
#module "b_dns" {
#	source = "./cloudflare"
#	cloudflare_domain = "${var.cloudflare_domain}"
#	cloudflare_name = "b"
#	cloudflare_value = "${module.b_host.ip}"
#}
#module "c_host" {
#	source = "./digitalocean"
#	hostname = "c"
#	region = "ams3"
#	size = "4gb"
#	ssh_fingerprint = "${var.ssh_fingerprint}"
#	ssh_key_file = "${var.ssh_key_file}"
#	authorized_keys_file = "${var.authorized_keys_file}"
#}
#module "c_dns" {
#	source = "./cloudflare"
#	cloudflare_domain = "${var.cloudflare_domain}"
#	cloudflare_name = "c"
#	cloudflare_value = "${module.c_host.ip}"
#}
