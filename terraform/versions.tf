terraform {
  required_providers = {
    digitalocean = {
      version = "~> 1.16"
    }
    cloudflare = {
      version   = "~> 2.0"
    }
    github = {
      version      = "2.4.0"
    }
    tls = {
      version = "2.2.0"
    }
  }
  required_version = ">= 1.1.0"
}

