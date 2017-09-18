variable "cloudflare_domain" {}
variable "cloudflare_name" {}
variable "cloudflare_value" {}

resource "cloudflare_record" "record" {
	domain = "${var.cloudflare_domain}"
	name = "${var.cloudflare_name}"
	value = "${var.cloudflare_value}"
	type = "A"
	ttl = "1" # automatic
}

output "hostname" {
	value = "${cloudflare_record.record.hostname}"
}

output "ip" {
	value = "${cloudflare_record.record.value}"
}