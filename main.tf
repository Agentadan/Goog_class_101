terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.25.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "gcp-project-1-416401"
  region = "us-central1"
  zone = "us-central1-a"
  credentials = "gcp-project-1-416401-63a193bbac80.json"
}

resource "google_storage_bucket" "nuggets-bucket" {
  name          = "nuggets-bucket"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}
}