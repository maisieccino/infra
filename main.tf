provider "digitalocean" {
  token   = var.do_token
  version = "~> 1.16"
}

module "minecraft" {
  source            = "./modules/minecraft"
  mc_server_key     = var.mc_server_key
  mc_server_key_pub = var.mc_server_key_pub
  dns_name          = "craft.bell.wtf"
  le_email          = var.le_email
  # Used to force creation _after_ DNS records set up.
  unused_craft_dns_meta = cloudflare_record.craft_bell_wtf_1.metadata
}
