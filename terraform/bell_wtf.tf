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

data "cloudflare_zones" "bell_wtf" {
  filter {
    name = "bell.wtf"
  }
}
# resource "cloudflare_zone" "bell_wtf" {
#   zone = "bell.wtf"
# }

resource "cloudflare_record" "bell_wtf_txt" {
  zone_id = data.cloudflare_zones.bell_wtf.zones[0].id
  type   = "TXT"
  name   = "@"
  value  = "google-site-verification=EOJkj2u4aswRLisMLCTtQSu0EOrHLc8guHUU4ZKGAUc"
  ttl = var.dns_record_ttl
}

resource "cloudflare_record" "nacl_bell_wtf" {
  zone_id = data.cloudflare_zones.bell_wtf.zones[0].id
  type   = "CNAME"
  name   = "nacl"
  value  = "mbellgb.github.io."
  ttl = var.dns_record_ttl
}

resource "cloudflare_record" "matt_bell_wtf" {
  zone_id = data.cloudflare_zones.bell_wtf.zones[0].id
  type   = "CNAME"
  name   = "matt"
  value  = "mbellgb.github.io."
  ttl = var.dns_record_ttl
}
