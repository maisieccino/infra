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
