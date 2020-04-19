output "droplet_ip" {
  value = digitalocean_droplet.mc_server.ipv4_address
}
output "lb_ip" {
  value = digitalocean_loadbalancer.mc_server.ip
}
