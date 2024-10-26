resource "google_compute_firewall" "fw-rule" {
    name = "jenkins-rule"
    network = google_compute_network.myvpc.id
    allow {
      protocol = "icmp"
    }
    allow {
      protocol = "tcp"
      ports = ["8080", "22", "8000"]
    }
    target_tags = [ "jenkins" ]
    priority = 1000
    direction = "INGRESS"
    source_ranges = [ "0.0.0.0/0" ]
}
resource "google_compute_firewall" "fw-rule-http" {
    name = "http-rule"
    network = google_compute_network.myvpc.id
    allow {
      protocol = "icmp"
    }
    allow {
      protocol = "tcp"
      ports = ["80"]
    }
    target_tags = [ "http-server" ]
    priority = 1000
    direction = "INGRESS"
    source_ranges = [ "0.0.0.0/0" ]
}