variable "do_token" {
    description = "DigitalOcean API token"
}

variable "ssh_public_key" {
    description = "SSH public key file"
}

variable "domain" {
    description = "Domain under which all infrastructure is available"
    default = "bourgon.org"
}

variable "cloudflare_email" {
    description = "CloudFlare email address"
}

variable "cloudflare_token" {
    description = "CloudFlare API token"
}