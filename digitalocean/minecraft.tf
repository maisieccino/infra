resource "digitalocean_droplet" "mc_server" {
  image   = "ubuntu-18-04-x64"
  name    = "mc"
  region  = "lon1"
  size    = "s-1vcpu-2gb"
  backups = true
}

resource "digitalocean_ssh_key" "mc_server_key" {
  name       = "MC Server Key"
  public_key = var.mc_server_key
}

resource "digitalocean_record" "craft_bell_wtf" {
  domain = data.digitalocean_domain.bell_wtf.name
  type   = "A"
  name   = "craft"
  value  = digitalocean_droplet.mc_server.ipv4_address
  ssh_keys = [
    digitalocean_ssh_key.mc_server_key.id
  ]
}
