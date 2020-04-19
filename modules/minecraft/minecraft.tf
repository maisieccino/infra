locals {
  region = "lon1"
}


data "template_file" "user_data" {
  template = file("${path.module}/files/userdata.yaml")
  vars = {
    dns_name = var.dns_name
    email    = var.le_email
  }
}

resource "digitalocean_droplet" "mc_server" {
  image      = "ubuntu-18-04-x64"
  name       = "mc"
  region     = local.region
  size       = "s-1vcpu-2gb"
  backups    = false
  monitoring = true
  ssh_keys = [
    digitalocean_ssh_key.mc_server_key.fingerprint
  ]
  tags = [
    "minecraft"
  ]
  private_networking = true
  user_data          = data.template_file.user_data.rendered
}

# Volume definition and attachment.
resource "digitalocean_volume" "mc_server" {
  region                  = local.region
  name                    = "serverdata"
  size                    = 30
  initial_filesystem_type = "ext4"
  description             = "Minecraft server volume"
  tags = [
    "minecraft"
  ]
}

resource "digitalocean_volume_attachment" "foobar" {
  droplet_id = digitalocean_droplet.mc_server.id
  volume_id  = digitalocean_volume.mc_server.id
}

resource "digitalocean_ssh_key" "mc_server_key" {
  name       = "Minecraft Server SSH Key"
  public_key = var.mc_server_key_pub
}
