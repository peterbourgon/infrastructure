resource "cloudflare_record" "record" {
	domain = "${var.domain}"
	name   = "${var.name}"
	value  = "${var.ip}"
	type   = "A"
}
