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
	source = "./digitalocean/bare"
	hostname = "archimedes"
	region = "nyc3"
	size = "2gb"
	ssh_fingerprint = "${var.ssh_fingerprint}"
	ssh_key_file = "${var.ssh_key_file}"
	authorized_keys_file = "${var.authorized_keys_file}"
}
#module "archimedes_dns" {
#	source = "./cloudflare"
#	cloudflare_domain = "${var.cloudflare_domain}"
#	cloudflare_name = "archimedes"
#	cloudflare_value = "${module.archimedes_host.ip}"
#}

#module "husserl_host" {
#	source = "./digitalocean/full"
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

#module "foo_host" {
#	source = "./digitalocean/full"
#	hostname = "foo"
#	region = "ams3"
#	size = "1gb"
#	ssh_fingerprint = "${var.ssh_fingerprint}"
#	ssh_key_file = "${var.ssh_key_file}"
#	authorized_keys_file = "${var.authorized_keys_file}"
#}
#module "foo_dns" {
#	source = "./cloudflare"
#	cloudflare_domain = "${var.cloudflare_domain}"
#	cloudflare_name = "foo"
#	cloudflare_value = "${module.foo_host.ip}"
#}
#module "bar_host" {
#	source = "./digitalocean/full"
#	hostname = "bar"
#	region = "ams3"
#	size = "1gb"
#	ssh_fingerprint = "${var.ssh_fingerprint}"
#	ssh_key_file = "${var.ssh_key_file}"
#	authorized_keys_file = "${var.authorized_keys_file}"
#}
#module "bar_dns" {
#	source = "./cloudflare"
#	cloudflare_domain = "${var.cloudflare_domain}"
#	cloudflare_name = "bar"
#	cloudflare_value = "${module.bar_host.ip}"
#}
#module "baz_host" {
#	source = "./digitalocean/full"
#	hostname = "baz"
#	region = "ams3"
#	size = "1gb"
#	ssh_fingerprint = "${var.ssh_fingerprint}"
#	ssh_key_file = "${var.ssh_key_file}"
#	authorized_keys_file = "${var.authorized_keys_file}"
#}
#module "baz_dns" {
#	source = "./cloudflare"
#	cloudflare_domain = "${var.cloudflare_domain}"
#	cloudflare_name = "baz"
#	cloudflare_value = "${module.baz_host.ip}"
#}
