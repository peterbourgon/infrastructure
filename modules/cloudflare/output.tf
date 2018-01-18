output "name" {
	value = "${cloudflare_record.record.hostname}"
}

output "ip" {
	value = "${cloudflare_record.record.value}"
}
