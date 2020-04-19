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
  region     = "lon1"
  size       = "s-1vcpu-2gb"
  backups    = true
  monitoring = true
  ssh_keys = [
    digitalocean_ssh_key.mc_server_key.fingerprint
  ]
  tags = [
    "minecraft"
  ]
  private_networking = true
  user_data          = data.template_file.user_data.rendered

  connection {
    type        = "ssh"
    user        = "root"
    host        = self.ipv4_address
    private_key = var.mc_server_key
  }
}

resource "digitalocean_floating_ip" "mc_server" {
  droplet_id = digitalocean_droplet.mc_server.id
  region     = digitalocean_droplet.mc_server.region
}

resource "digitalocean_ssh_key" "mc_server_key" {
  name       = "Minecraft Server SSH Key"
  public_key = var.mc_server_key_pub
}
