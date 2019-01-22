// Configure the Google Cloud provider
provider "google" {
  version     = "1.20.0"
  credentials = "${file("gcp-key.json")}"
  project     = "terraform-test-229410"
  region      = "europe-west2"
}

// A single Google Cloud Engine instance
resource "google_compute_instance" "default" {
  name         = "my-first-terraform-vm"
  machine_type = "f1-micro"
  zone         = "europe-west2-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Include this section to give the VM an external ip address
    }
  }
}
