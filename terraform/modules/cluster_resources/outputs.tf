output "cluster_ingress_address" {
  value = kubernetes_service.ingress_nginx_controller.load_balancer_ingress[0].ip
}
