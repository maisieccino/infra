provider "digitalocean" {
  token   = var.do_token
  version = "~> 1.16"
}

provider "cloudflare" {
  version   = "~> 2.0"
  email     = var.cloudflare_email
  api_token = var.cloudflare_api_token
}

provider "github" {
  version = "2.4.0"
  token = var.github_token
  organization = "mbellgb"
  individual = false
}

// K8s cluster initialisation

module "cluster" {
  source = "./modules/cluster"
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
