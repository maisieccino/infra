provider "digitalocean" {
  token = var.do_token
}

provider "cloudflare" {
  email     = var.cloudflare_email
  api_token = var.cloudflare_api_token
}

provider "github" {
  token        = var.github_token
  organization = "himaisie"
  individual   = false
}

provider "google" {
  credentials = base64decode(var.gcp_credentials_encoded)
  project     = var.gcp_project
  region      = var.gcp_region
}

provider "tailscale" {
  api_key = var.tailscale_api_key
  tailnet = var.tailscale_tailnet
}
