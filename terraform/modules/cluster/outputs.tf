output "api_host" {
  value = digitalocean_kubernetes_cluster.main.endpoint
}

output "api_token" {
  value = digitalocean_kubernetes_cluster.main.kube_config[0].token
}

output "ca_certificate" {
  value = digitalocean_kubernetes_cluster.main.kube_config[0].cluster_ca_certificate
}

output "cluster_ingress_address" {
  value = kubernetes_service.ingress_nginx_controller.load_balancer_ingress[0].ip
}
