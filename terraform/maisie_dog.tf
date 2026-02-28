
resource "cloudflare_zone" "maisie_dog" {
  zone = "maisie.dog"
}

resource "cloudflare_record" "atproto_mbell_dog" {
  zone_id = cloudflare_zone.maisie_dog.id
  name = "_atproto"
  type = "TXT"
  ttl = var.dns_record_ttl
  value = "did=did:plc:y3hux44nccewwyrdd3tachy3"
}

resource "cloudflare_record" "login_maisie_dog" {
  name = "login"
  zone_id = cloudflare_zone.maisie_dog.id
  type = "CNAME"
  ttl = var.dns_record_ttl
  value = "maisie-cd-34lpwpjxh6evhyjn.edge.tenants.eu.auth0.com"
}
