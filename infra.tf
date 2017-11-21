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

module "upspin_host" {
	source               = "./digitalocean/droplet/freebsd"
	hostname             = "upspin"
	region               = "sfo2"
	size                 = "512mb"
	ssh_fingerprint      = "${var.ssh_fingerprint}"
	user                 = "peter"
	authorized_keys_file = "${var.authorized_keys_file}"
}
module "upspin_dns" {
	source            = "./cloudflare"
	cloudflare_domain = "${var.cloudflare_domain}"
	cloudflare_name   = "${module.upspin_host.hostname}"
	cloudflare_value  = "${module.upspin_host.ip}"
}

#module "lacroix_host" {
#	source               = "./digitalocean/droplet/linux"
#	hostname             = "lacroix"
#	region               = "nyc1"
#	size                 = "2gb"
#	ssh_fingerprint      = "${var.ssh_fingerprint}"
#	user                 = "peter"
#	authorized_keys_file = "${var.authorized_keys_file}"
#}
#module "lacroix_dns" {
#	source            = "./cloudflare"
#	cloudflare_domain = "${var.cloudflare_domain}"
#	cloudflare_name   = "${module.lacroix_host.hostname}"
#	cloudflare_value  = "${module.lacroix_host.ip}"
#}

#module "apricot_host" {
#	source               = "./digitalocean/droplet/linux"
#	hostname             = "apricot"
#	region               = "nyc1"
#	size                 = "1gb"
#	ssh_fingerprint      = "${var.ssh_fingerprint}"
#	user                 = "peter"
#	authorized_keys_file = "${var.authorized_keys_file}"
#}
#module "apricot_dns" {
#	source            = "./cloudflare"
#	cloudflare_domain = "${var.cloudflare_domain}"
#	cloudflare_name   = "${module.apricot_host.hostname}"
#	cloudflare_value  = "${module.apricot_host.ip}"
#}

