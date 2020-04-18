provider "digitalocean" {
  token = var.do_token
}

data "digitalocean_domain" "bell_wtf" {
  name = "bell.wtf"
}
