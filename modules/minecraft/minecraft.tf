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

  connection {
    type        = "ssh"
    user        = "root"
    host        = self.ipv4_address
    private_key = var.mc_server_key
  }
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

# Networking.

resource "digitalocean_floating_ip" "mc_server" {
  droplet_id = digitalocean_droplet.mc_server.id
  region     = digitalocean_droplet.mc_server.region
}

resource "digitalocean_firewall" "mcserver" {
  name        = "web-ssh-only"
  droplet_ids = [digitalocean_droplet.mc_server.id]

  inbound_rule {
    protocol   = "tcp"
    port_range = "22"
    # may be restricted if I cba to set up a bastion.
    source_addresses = ["0.0.0.0/8"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/8"]
  }
  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["0.0.0.0/8"]
  }
  outbound_rule {
    protocol   = "tcp"
    port_range = "1-65535"
  }
  outbound_rule {
    protocol   = "udp"
    port_range = "1-65535"
  }
}
