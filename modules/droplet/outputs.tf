output "ip" {
	value = "${digitalocean_droplet.default.ipv4_address}"
}

output "name" {
	value = "${digitalocean_droplet.default.name}"
}