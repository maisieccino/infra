
resource "digitalocean_droplet" "mc_server" {
  image  = "ubuntu-18-04-x64"
  name   = "mc"
  region = "lon1"
  size   = "s-1vcpu-2gb"
}

resource "digitalocean_record" "craft_bell_wtf" {
  domain = digitalocean_domain.bell_wtf.name
  type   = "A"
  name   = "craft"
  value  = digitalocean_droplet.mc_server.ipv4_address
}
