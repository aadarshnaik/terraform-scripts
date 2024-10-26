resource "google_compute_instance" "jenkins-master" {
  name = "jenkins-master"
  machine_type = "e2-medium"
  zone = "asia-south1-a"
  tags = [tolist(google_compute_firewall.fw-rule.target_tags)[0], tolist(google_compute_firewall.fw-rule-http.target_tags)[0]]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }
  metadata_startup_script = file("${path.module}/master-script.sh")
  network_interface {
    network = google_compute_network.myvpc.id
    subnetwork = google_compute_subnetwork.mysubnet.id
    access_config {
        
    }
  }
}

resource "google_compute_instance" "jenkins_slave" {
  name = "jenkins-slave"
  machine_type = "e2-micro"
  zone = "asia-south1-a"
  tags = [ tolist(google_compute_firewall.fw-rule.target_tags)[0] ]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }   
  network_interface {
    network = google_compute_network.myvpc.id
    subnetwork = google_compute_subnetwork.mysubnet.id
    access_config {
        
    }
  }
}