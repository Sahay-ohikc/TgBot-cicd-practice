resource "google_compute_firewall" "bastion52-ssh" {
  name    = "bastion52-ssh" 
  network = google_compute_network.zone52.name
  allow {
    protocol = "tcp"
    ports    = ["22", "7000"]
  }
  direction = "INGRESS"
  target_tags = ["bastion", "public", "private"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "bastion52-http" {
  name    = "bastion52-http" 
  network = google_compute_network.zone52.name
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  direction = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "workhorse-rules" {
  name    = "workhorse-rules"
  network = google_compute_network.zone52.name
  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }
  direction = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
}