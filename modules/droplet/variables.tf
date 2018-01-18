variable "user" {
    description = "User account name"
}

variable "ssh_key_fingerprint" {
    description = "Fingerprint for SSH key in DigitalOcean"
}

variable "image" {
    description = "Droplet image slug"
}

variable "name" {
    description = "Name of host"
}

variable "region" {
    description = "Region to deploy into"
}

variable "size" {
    description = "Size of droplet"
}

variable "root_provisioning" {
    description = "List of remote-exec commands to run as root"
    type = "list"
}

variable "user_provisioning_one" {
    description = "List of remote-exec commands to run as user, in the first phase"
    type = "list"
}

variable "user_provisioning_two" {
    description = "List of remote-exec commands to run as user, in the second phase (optional)"
    type = "list"
    default = []
}
