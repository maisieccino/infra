resource "digitalocean_kubernetes_cluster" "main" {
  name    = "main"
  region  = "lon1"
  version = "1.17.5-do.0"

  node_pool {
    name       = "default"
    size       = "s-1vcpu-2gb"
    auto_scale = true
    min_nodes  = 2
    max_nodes  = 4
  }
}
