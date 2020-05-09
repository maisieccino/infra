output "api_endpoint" {
  value = digitalocean_kubernetes_cluster.main.endpoint
}

output "api_token" {
  value = digitalocean_kubernetes_cluster.main.kube_config[0].token
}

output "ca_certificate" {
  value = digitalocean_kubernetes_cluster.main.kube_config[0].cluster_ca_certificate
}
