provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
      size  = var.disk_size
    }
  }

  network_interface {
    network = "default"
    access_config {} # This assigns an external IP
  }

  tags = ["jenkins-server"]

  scheduling {
    preemptible       = false
    automatic_restart = true
  }
}

resource "google_container_cluster" "gke_cluster" {
  name     = "microservices-cluster"
  location = var.zone

  remove_default_node_pool = true
  initial_node_count       = 1

  network    = "default"
  subnetwork = "default"
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "gke-node-pool"
  location   = var.zone
  cluster    = google_container_cluster.gke_cluster.name

  node_count = 2

  node_config {
    machine_type = "e2-standard-4"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    preemptible  = false
  }
}