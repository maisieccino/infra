provider "cloudflare" {
  version = "~> 2.0"
  email   = var.cloudflare_email
  api_key = var.cloudflare_api_key
}

# data "cloudflare_zones" "bell_wtf" {
#   filter {
#     name   = "bell.wtf"
#     status = "active"
#     paused = false
#   }
# }

# resource "cloudflare_record" "craft_bell_wtf_1" {
#   zone_id = lookup(data.cloudflare_zones.bell_wtf.zones[0], "id")
#   name    = "craft"
#   type    = "NS"
#   value   = "ns1.digitalocean.com"
#   ttl     = var.dns_record_ttl
# }

# resource "cloudflare_record" "craft_bell_wtf_2" {
#   zone_id = lookup(data.cloudflare_zones.bell_wtf.zones[0], "id")
#   name    = "craft"
#   type    = "NS"
#   value   = "ns2.digitalocean.com"
#   ttl     = var.dns_record_ttl
# }

# resource "cloudflare_record" "craft_bell_wtf_3" {
#   zone_id = lookup(data.cloudflare_zones.bell_wtf.zones[0], "id")
#   name    = "craft"
#   type    = "NS"
#   value   = "ns3.digitalocean.com"
#   ttl     = var.dns_record_ttl
# }

resource "digitalocean_domain" "bell_wtf" {
  name = "bell.wtf"
}

resource "digitalocean_record" "bell_wtf_txt" {
  domain = digitalocean_domain.bell_wtf.id
  type   = "TXT"
  name   = "@"
  value  = "google-site-verification=EOJkj2u4aswRLisMLCTtQSu0EOrHLc8guHUU4ZKGAUc"
}

resource "digitalocean_record" "nacl_bell_wtf" {
  domain = digitalocean_domain.bell_wtf.id
  type   = "CNAME"
  name   = "nacl"
  value  = "mbellgb.github.io."
}

resource "digitalocean_record" "matt_bell_wtf" {
  domain = digitalocean_domain.bell_wtf.id
  type   = "CNAME"
  name   = "matt"
  value  = "mbellgb.github.io."
}
