# account.json
# - APIs & Services > Credentials > Create credentials > Service account key
# - Compute Engine default service account > JSON > Create

provider "google" {
  credentials = "${file("account.json")}"
  project     = "professor-wiggles"
}

#resource "google_compute_instance" "default" {
#  name         = "microweb"
#  machine_type = "f1-micro"
#  zone         = "us-west1-b"
#
#  boot_disk {
#    initialize_params {
#      image = "debian-cloud/debian-9"
#    }
#  }
#
#  network_interface {
#    network = "default"
#
#    access_config {
#      # Specifying this block grants an ephemeral IP
#    }
#  }
#}


# gcloud compute config-ssh
# edit an/inventory.ini an/*.yml

