terraform {
  required_version = ">= 1.12.0, < 2.0.0"

  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = "~> 2.83"
    }
  }
}
