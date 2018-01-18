provider "digitalocean" {
	token = "${var.do_token}"
}

provider "cloudflare" {
	email = "${var.cloudflare_email}"
	token = "${var.cloudflare_token}"
}

module "ssh_key" {
	source         = "./modules/digitalocean-ssh-key"
	ssh_public_key = "${var.ssh_public_key}"
}
