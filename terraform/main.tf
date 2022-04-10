provider "digitalocean" {
  token   = var.do_token
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

// K8s cluster.

provider "kubernetes" {
  host             = module.cluster.api_endpoint
  token            = module.cluster.api_token
  cluster_ca_certificate = base64decode(
    module.cluster.ca_certificate
  )
}

# // Minecraft server and related DNS record.
#
# module "minecraft" {
#   source            = "./modules/minecraft"
#   mc_server_key     = var.mc_server_key
#   mc_server_key_pub = var.mc_server_key_pub
#   dns_name          = "craft.bell.wtf"
#   le_email          = var.le_email
# }
#
# resource "digitalocean_record" "craft_bell_wtf" {
#   domain = digitalocean_domain.bell_wtf.id
#   type   = "A"
#   name   = "craft"
#   value  = module.minecraft.lb_ip
# }
