resource "digitalocean_ssh_key" "default" {
	name       = "Terraform SSH key"
	public_key = "${file("${var.ssh_public_key}")}"
}
