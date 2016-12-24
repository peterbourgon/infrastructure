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
#	source = "./digitalocean/bare"
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
#	source = "./digitalocean/bare"
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
#	source = "./digitalocean/bare"
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
# https://gist.github.com/peterbourgon/c1841cbed2e4d2db0ff0ae7b4f2cf2da

#module "forward1_host" {
#	source = "./digitalocean/bare"
#	hostname = "forward1"
#	region = "fra1"
#	size = "1gb"
#	ssh_fingerprint = "${var.ssh_fingerprint}"
#	ssh_key_file = "${var.ssh_key_file}"
#	authorized_keys_file = "${var.authorized_keys_file}"
#}
#module "forward1_dns" {
#	source = "./cloudflare"
#	cloudflare_domain = "${var.cloudflare_domain}"
#	cloudflare_name = "forward1"
#	cloudflare_value = "${module.forward1_host.ip}"
#}
#module "forward2_host" {
#	source = "./digitalocean/bare"
#	hostname = "forward2"
#	region = "fra1"
#	size = "1gb"
#	ssh_fingerprint = "${var.ssh_fingerprint}"
#	ssh_key_file = "${var.ssh_key_file}"
#	authorized_keys_file = "${var.authorized_keys_file}"
#}
#module "forward2_dns" {
#	source = "./cloudflare"
#	cloudflare_domain = "${var.cloudflare_domain}"
#	cloudflare_name = "forward2"
#	cloudflare_value = "${module.forward2_host.ip}"
#}
#module "forward3_host" {
#	source = "./digitalocean/bare"
#	hostname = "forward3"
#	region = "fra1"
#	size = "1gb"
#	ssh_fingerprint = "${var.ssh_fingerprint}"
#	ssh_key_file = "${var.ssh_key_file}"
#	authorized_keys_file = "${var.authorized_keys_file}"
#}
#module "forward3_dns" {
#	source = "./cloudflare"
#	cloudflare_domain = "${var.cloudflare_domain}"
#	cloudflare_name = "forward3"
#	cloudflare_value = "${module.forward3_host.ip}"
#}
#module "ingest1_host" {
#	source = "./digitalocean/bare"
#	hostname = "ingest1"
#	region = "fra1"
#	size = "1gb"
#	ssh_fingerprint = "${var.ssh_fingerprint}"
#	ssh_key_file = "${var.ssh_key_file}"
#	authorized_keys_file = "${var.authorized_keys_file}"
#}
#module "ingest1_dns" {
#	source = "./cloudflare"
#	cloudflare_domain = "${var.cloudflare_domain}"
#	cloudflare_name = "ingest1"
#	cloudflare_value = "${module.ingest1_host.ip}"
#}
#module "ingest2_host" {
#	source = "./digitalocean/bare"
#	hostname = "ingest2"
#	region = "fra1"
#	size = "1gb"
#	ssh_fingerprint = "${var.ssh_fingerprint}"
#	ssh_key_file = "${var.ssh_key_file}"
#	authorized_keys_file = "${var.authorized_keys_file}"
#}
#module "ingest2_dns" {
#	source = "./cloudflare"
#	cloudflare_domain = "${var.cloudflare_domain}"
#	cloudflare_name = "ingest2"
#	cloudflare_value = "${module.ingest2_host.ip}"
#}
#module "ingest3_host" {
#	source = "./digitalocean/bare"
#	hostname = "ingest3"
#	region = "fra1"
#	size = "1gb"
#	ssh_fingerprint = "${var.ssh_fingerprint}"
#	ssh_key_file = "${var.ssh_key_file}"
#	authorized_keys_file = "${var.authorized_keys_file}"
#}
#module "ingest3_dns" {
#	source = "./cloudflare"
#	cloudflare_domain = "${var.cloudflare_domain}"
#	cloudflare_name = "ingest3"
#	cloudflare_value = "${module.ingest3_host.ip}"
#}
#module "store1_host" {
#	source = "./digitalocean/bare"
#	hostname = "store1"
#	region = "fra1"
#	size = "1gb"
#	ssh_fingerprint = "${var.ssh_fingerprint}"
#	ssh_key_file = "${var.ssh_key_file}"
#	authorized_keys_file = "${var.authorized_keys_file}"
#}
#module "store1_dns" {
#	source = "./cloudflare"
#	cloudflare_domain = "${var.cloudflare_domain}"
#	cloudflare_name = "store1"
#	cloudflare_value = "${module.store1_host.ip}"
#}
#module "store2_host" {
#	source = "./digitalocean/bare"
#	hostname = "store2"
#	region = "fra1"
#	size = "1gb"
#	ssh_fingerprint = "${var.ssh_fingerprint}"
#	ssh_key_file = "${var.ssh_key_file}"
#	authorized_keys_file = "${var.authorized_keys_file}"
#}
#module "store2_dns" {
#	source = "./cloudflare"
#	cloudflare_domain = "${var.cloudflare_domain}"
#	cloudflare_name = "store2"
#	cloudflare_value = "${module.store2_host.ip}"
#}
#module "store3_host" {
#	source = "./digitalocean/bare"
#	hostname = "store3"
#	region = "fra1"
#	size = "1gb"
#	ssh_fingerprint = "${var.ssh_fingerprint}"
#	ssh_key_file = "${var.ssh_key_file}"
#	authorized_keys_file = "${var.authorized_keys_file}"
#}
#module "store3_dns" {
#	source = "./cloudflare"
#	cloudflare_domain = "${var.cloudflare_domain}"
#	cloudflare_name = "store3"
#	cloudflare_value = "${module.store3_host.ip}"
#}
