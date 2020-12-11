resource "digitalocean_kubernetes_cluster" "main" {
  name    = "main"
  region  = "lon1"
  version = "1.18.10-do.2"

  node_pool {
    name       = "default"
    size       = "s-2vcpu-4gb"
    auto_scale = true
    min_nodes  = 1
    max_nodes  = 4
  }
}
