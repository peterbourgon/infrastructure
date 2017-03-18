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
#	source = "./digitalocean/bare"
#	hostname = "archimedes"
#	region = "nyc3"
#	size = "2gb"
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

module "zipkin_host" {
	source = "./digitalocean/full"
	hostname = "zipkin"
	region = "ams3"
	size = "4gb"
	ssh_fingerprint = "${var.ssh_fingerprint}"
	ssh_key_file = "${var.ssh_key_file}"
	authorized_keys_file = "${var.authorized_keys_file}"
}
module "zipkin_dns" {
	source = "./cloudflare"
	cloudflare_domain = "${var.cloudflare_domain}"
	cloudflare_name = "zipkin"
	cloudflare_value = "${module.zipkin_host.ip}"
}


module "k0_host" {
	source = "./digitalocean/bare"
	hostname = "k0"
	region = "ams3"
	size = "1gb"
	ssh_fingerprint = "${var.ssh_fingerprint}"
	ssh_key_file = "${var.ssh_key_file}"
	authorized_keys_file = "${var.authorized_keys_file}"
}
module "k0_dns" {
	source = "./cloudflare"
	cloudflare_domain = "${var.cloudflare_domain}"
	cloudflare_name = "k0"
	cloudflare_value = "${module.k0_host.ip}"
}
module "k1_host" {
	source = "./digitalocean/bare"
	hostname = "k1"
	region = "ams3"
	size = "1gb"
	ssh_fingerprint = "${var.ssh_fingerprint}"
	ssh_key_file = "${var.ssh_key_file}"
	authorized_keys_file = "${var.authorized_keys_file}"
}
module "k1_dns" {
	source = "./cloudflare"
	cloudflare_domain = "${var.cloudflare_domain}"
	cloudflare_name = "k1"
	cloudflare_value = "${module.k1_host.ip}"
}
module "k2_host" {
	source = "./digitalocean/bare"
	hostname = "k2"
	region = "ams3"
	size = "1gb"
	ssh_fingerprint = "${var.ssh_fingerprint}"
	ssh_key_file = "${var.ssh_key_file}"
	authorized_keys_file = "${var.authorized_keys_file}"
}
module "k2_dns" {
	source = "./cloudflare"
	cloudflare_domain = "${var.cloudflare_domain}"
	cloudflare_name = "k2"
	cloudflare_value = "${module.k2_host.ip}"
}
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
#module "forward4_host" {
#	source = "./digitalocean/bare"
#	hostname = "forward4"
#	region = "fra1"
#	size = "1gb"
#	ssh_fingerprint = "${var.ssh_fingerprint}"
#	ssh_key_file = "${var.ssh_key_file}"
#	authorized_keys_file = "${var.authorized_keys_file}"
#}
#module "forward4_dns" {
#	source = "./cloudflare"
#	cloudflare_domain = "${var.cloudflare_domain}"
#	cloudflare_name = "forward4"
#	cloudflare_value = "${module.forward4_host.ip}"
#}
#module "forward5_host" {
#	source = "./digitalocean/bare"
#	hostname = "forward5"
#	region = "fra1"
#	size = "1gb"
#	ssh_fingerprint = "${var.ssh_fingerprint}"
#	ssh_key_file = "${var.ssh_key_file}"
#	authorized_keys_file = "${var.authorized_keys_file}"
#}
#module "forward5_dns" {
#	source = "./cloudflare"
#	cloudflare_domain = "${var.cloudflare_domain}"
#	cloudflare_name = "forward5"
#	cloudflare_value = "${module.forward5_host.ip}"
#}
#module "forward6_host" {
#	source = "./digitalocean/bare"
#	hostname = "forward6"
#	region = "fra1"
#	size = "1gb"
#	ssh_fingerprint = "${var.ssh_fingerprint}"
#	ssh_key_file = "${var.ssh_key_file}"
#	authorized_keys_file = "${var.authorized_keys_file}"
#}
#module "forward6_dns" {
#	source = "./cloudflare"
#	cloudflare_domain = "${var.cloudflare_domain}"
#	cloudflare_name = "forward6"
#	cloudflare_value = "${module.forward6_host.ip}"
#}
#module "forward7_host" {
#	source = "./digitalocean/bare"
#	hostname = "forward7"
#	region = "fra1"
#	size = "1gb"
#	ssh_fingerprint = "${var.ssh_fingerprint}"
#	ssh_key_file = "${var.ssh_key_file}"
#	authorized_keys_file = "${var.authorized_keys_file}"
#}
#module "forward7_dns" {
#	source = "./cloudflare"
#	cloudflare_domain = "${var.cloudflare_domain}"
#	cloudflare_name = "forward7"
#	cloudflare_value = "${module.forward7_host.ip}"
#}
#module "forward8_host" {
#	source = "./digitalocean/bare"
#	hostname = "forward8"
#	region = "fra1"
#	size = "1gb"
#	ssh_fingerprint = "${var.ssh_fingerprint}"
#	ssh_key_file = "${var.ssh_key_file}"
#	authorized_keys_file = "${var.authorized_keys_file}"
#}
#module "forward8_dns" {
#	source = "./cloudflare"
#	cloudflare_domain = "${var.cloudflare_domain}"
#	cloudflare_name = "forward8"
#	cloudflare_value = "${module.forward8_host.ip}"
#}
#module "ingest1_host" {
#	source = "./digitalocean/bare"
#	hostname = "ingest1"
#	region = "fra1"
#	size = "8gb"
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
#	size = "8gb"
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
#	size = "8gb"
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
#	size = "8gb"
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
#	size = "8gb"
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
#	size = "8gb"
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
#module "store4_host" {
#	source = "./digitalocean/bare"
#	hostname = "store4"
#	region = "fra1"
#	size = "8gb"
#	ssh_fingerprint = "${var.ssh_fingerprint}"
#	ssh_key_file = "${var.ssh_key_file}"
#	authorized_keys_file = "${var.authorized_keys_file}"
#}
#module "store4_dns" {
#	source = "./cloudflare"
#	cloudflare_domain = "${var.cloudflare_domain}"
#	cloudflare_name = "store4"
#	cloudflare_value = "${module.store4_host.ip}"
#}
#module "store5_host" {
#	source = "./digitalocean/bare"
#	hostname = "store5"
#	region = "fra1"
#	size = "8gb"
#	ssh_fingerprint = "${var.ssh_fingerprint}"
#	ssh_key_file = "${var.ssh_key_file}"
#	authorized_keys_file = "${var.authorized_keys_file}"
#}
#module "store5_dns" {
#	source = "./cloudflare"
#	cloudflare_domain = "${var.cloudflare_domain}"
#	cloudflare_name = "store5"
#	cloudflare_value = "${module.store5_host.ip}"
#}
#module "store6_host" {
#	source = "./digitalocean/bare"
#	hostname = "store6"
#	region = "fra1"
#	size = "8gb"
#	ssh_fingerprint = "${var.ssh_fingerprint}"
#	ssh_key_file = "${var.ssh_key_file}"
#	authorized_keys_file = "${var.authorized_keys_file}"
#}
#module "store6_dns" {
#	source = "./cloudflare"
#	cloudflare_domain = "${var.cloudflare_domain}"
#	cloudflare_name = "store6"
#	cloudflare_value = "${module.store6_host.ip}"
#}
#module "store7_host" {
#	source = "./digitalocean/bare"
#	hostname = "store7"
#	region = "fra1"
#	size = "8gb"
#	ssh_fingerprint = "${var.ssh_fingerprint}"
#	ssh_key_file = "${var.ssh_key_file}"
#	authorized_keys_file = "${var.authorized_keys_file}"
#}
#module "store7_dns" {
#	source = "./cloudflare"
#	cloudflare_domain = "${var.cloudflare_domain}"
#	cloudflare_name = "store7"
#	cloudflare_value = "${module.store7_host.ip}"
#}
#module "store8_host" {
#	source = "./digitalocean/bare"
#	hostname = "store8"
#	region = "fra1"
#	size = "8gb"
#	ssh_fingerprint = "${var.ssh_fingerprint}"
#	ssh_key_file = "${var.ssh_key_file}"
#	authorized_keys_file = "${var.authorized_keys_file}"
#}
#module "store8_dns" {
#	source = "./cloudflare"
#	cloudflare_domain = "${var.cloudflare_domain}"
#	cloudflare_name = "store8"
#	cloudflare_value = "${module.store8_host.ip}"
#}