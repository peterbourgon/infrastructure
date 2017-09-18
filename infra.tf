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

variable "cloudflare_domain"    {}
variable "ssh_fingerprint"      {}
variable "authorized_keys_file" {}

#module "planck_host" {
#	source               = "./digitalocean/droplet/freebsd"
#	hostname             = "planck"
#	region               = "fra1"
#	size                 = "1gb"
#	ssh_fingerprint      = "${var.ssh_fingerprint}"
#	user                 = "peter"
#	authorized_keys_file = "${var.authorized_keys_file}"
#}
#
#module "planck_dns" {
#	source            = "./cloudflare"
#	cloudflare_domain = "${var.cloudflare_domain}"
#	cloudflare_name   = "${module.planck_host.hostname}"
#	cloudflare_value  = "${module.planck_host.ip}"
#}

