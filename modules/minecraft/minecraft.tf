resource "digitalocean_droplet" "mc_server" {
  image   = "ubuntu-18-04-x64"
  name    = "mc"
  region  = "lon1"
  size    = "s-1vcpu-2gb"
  backups = true
  ssh_keys = [
    digitalocean_ssh_key.mc_server_key.id
  ]
}
