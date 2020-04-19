output "ipv4_address" {
  value = digitalocean_floating_ip.mc_server.ip_address
}
