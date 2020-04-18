data "digitalocean_domain" "bell_wtf" {
  name = "bell.wtf"
}

resource "digitalocean_record" "craft" {
  domain = digitalocean_domain.bell_wtf
  type   = "A"
  name   = "craft"
  value  = module.minecraft.ipv4_address
}
