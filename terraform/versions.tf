terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 1.16"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
      version   = "~> 2.0"
    }
    github = {
      source = "hashicorp/github"
      version      = "2.4.0"
    }
    tls = {
      source = "hashicorp/tls"
      version = "2.2.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
  required_version = ">= 1.1.0"
}

