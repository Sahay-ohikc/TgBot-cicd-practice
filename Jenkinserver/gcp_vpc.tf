resource "google_compute_network" "zone53" {
  name = "zone53-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "zone53-private" {
  name            = "zone53-private-sub"
  ip_cidr_range   = "10.53.2.0/24"
  region          = "us-east1"
  network         = google_compute_network.zone53.id
}

resource "google_compute_subnetwork" "zone53-public" {
  name            = "zone53-public-sub"
  ip_cidr_range   = "10.52.1.0/24"
  region          = "us-east1"
  network         = google_compute_network.zone53.id
}

resource "google_compute_firewall" "zone53-http" {
  name    = "zone53-http" 
  network = google_compute_network.zone53.name
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  direction = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "jenkins-rules" {
  name    = "jenkins-rules"
  network = google_compute_network.zone53.name
  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }
  direction = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "zone53-ssh" {
  name    = "zone53-ssh" 
  network = google_compute_network.zone53.name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  direction = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
}

