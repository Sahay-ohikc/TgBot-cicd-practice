data "google_compute_address" "jenkins-ip" {
  name         = "jenkins-ip1"
}

resource "google_compute_instance" "jenkins" {
  name         = "jenkins"
  machine_type = "e2-small"
  zone         = "us-east1-b"
  tags         = ["jenkins", "public"]
  boot_disk {
    initialize_params {
      image = "family/ubuntu-2004-lts"
    }
  }
  network_interface {
    subnetwork = google_compute_subnetwork.zone53-public.id
    access_config {
      network_tier = "STANDARD"
      nat_ip = data.google_compute_address.jenkins-ip.address
    }
  }
  metadata_startup_script = file("jenkins-startup-script.sh")
}