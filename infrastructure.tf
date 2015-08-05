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

module "socrates_host" {
	source = "./digitalocean"
	hostname = "socrates"
	region = "ams3"
	size = "512mb"
	ssh_fingerprint = "${var.ssh_fingerprint}"
	ssh_key_file = "${var.ssh_key_file}"
	authorized_keys_file = "${var.authorized_keys_file}"
}

variable "cloudflare_domain" {}

module "socrates_dns" {
	source = "./cloudflare"
	cloudflare_domain = "${var.cloudflare_domain}"
	cloudflare_name = "socrates"
	cloudflare_value = "${module.socrates_host.ip}"
}