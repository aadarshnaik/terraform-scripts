terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.8.0"
    }
  }
}

provider "google" {
    project = "learn-gke-2024"
    region = "asia-south1"
    zone = "asia-south1-a"
}