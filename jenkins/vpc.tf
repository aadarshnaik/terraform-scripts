resource "google_compute_network" "myvpc" {
  name = "custom-nw"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "mysubnet" {
  name = "subnet1"
  network = google_compute_network.myvpc.id
  region = "asia-south1"
  ip_cidr_range = "10.0.1.0/24"
}
