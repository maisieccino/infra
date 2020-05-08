resource "kubernetes_stateful_set" "memcached" {
  metadata {
    name = "memcached"
    namespace = kubernetes_namespace.flux.metadata[0].name
    labels = {
      app = "memcached"
      release = "memcached"
    }
  }
  spec {
    service_name = "memcached"
    replicas = 2
    update_strategy {
      type = "RollingUpdate"
    }
    template {
      metadata {
        labels 
      }
    }
  }
}
