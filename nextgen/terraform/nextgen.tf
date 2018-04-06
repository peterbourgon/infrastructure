# account.json
# - APIs & Services > Credentials > Create credentials > Service account key
# - Compute Engine default service account > JSON > Create

provider "google" {
  credentials = "${file("account.json")}"
  project     = "professor-wiggles"
}

resource "google_compute_instance" "microweb" {
  name         = "microweb"
  machine_type = "f1-micro"
  zone         = "us-west1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"

    access_config {
      # Specifying this block grants an ephemeral IP
    }
  }
}

# gcloud compute config-ssh
# edit an/inventory.ini an/*.yml

data "template_file" "inventory" {
  template = "${file("${path.module}/inventory.template")}"

  depends_on = [
    "google_compute_instance.microweb",
  ]

  vars {
    microweb = "microweb ansible_host=${google_compute_instance.microweb.name}.${google_compute_instance.microweb.zone}.${google_compute_instance.microweb.project}"
  }
}

resource "null_resource" "inventory" {
  triggers {
    template_rendered = "${ data.template_file.inventory.rendered }"
  }

  provisioner "local-exec" {
    command = "echo '${ data.template_file.inventory.rendered }' > ../ansible/inventory.ini"
  }
}
