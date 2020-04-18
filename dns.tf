provider "cloudflare" {
  version = "~> 2.0"
  email   = var.cloudflare_email
  api_key = var.cloudflare_api_key
}

data "cloudflare_zones" "bell_wtf" {
  filter {
    name   = "bell.wtf"
    status = "active"
    paused = false
  }
}

resource "cloudflare_record" "craft_bell_wtf" {
  zone_id = lookup(data.cloudflare_zones.bell_wtf.zones[0], "id")
  name    = "craft"
  type    = "A"
  value   = module.minecraft.ipv4_address
  ttl     = var.dns_record_ttl
}
