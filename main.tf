provider "google" {
  project = var.project_id
  region  = var.region
  credentials = {
    type                        = "external_account"
    audience                    = var.audience
    subject_token_type          = "urn:ietf:params:oauth:token-type:jwt"
    token_url                   = "https://sts.googleapis.com/v1/token"
    credential_source {
      file = "/path/to/token"
    }
  }
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "e2-medium"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}

variable "project_id" {}
variable "region" {}
variable "zone" {}
variable "audience" {}
