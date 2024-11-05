terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.3.1"
    }
  }

  backend "gcs" {
    bucket = "tf-github-repos-state"
    prefix = "terraform/state"
  }
}

provider "github" {
  token = var.token
}
