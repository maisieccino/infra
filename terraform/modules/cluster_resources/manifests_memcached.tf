resource "kubernetes_stateful_set" "memcached" {
  metadata {
    name      = "memcached"
    namespace = kubernetes_namespace.flux.metadata[0].name
    labels = {
      app     = "memcached"
      release = "memcached"
    }
  }
  spec {
    service_name = "memcache"
    replicas     = 3
    update_strategy {
      type = "RollingUpdate"
    }
    selector {
      match_labels = {
        app     = "memcached"
        release = "memcache"
      }
    }
    template {
      metadata {
        labels = {
          app     = "memcached"
          release = "memcache"
        }
        annotations = {
          "prometheus.io/scrape" = "true"
          "prometheus.io/port"   = "9150"
        }
      }
      spec {
        security_context {
          fs_group = 1001
        }
        container {
          name  = "memcached"
          image = "memcached:1.5.20-alpine"
          security_context {
            run_as_user = 1001
          }
          command = [
            "memcached",
            "-m 64",
            "-o",
            "modern",
            "-v"
          ]
          port {
            name           = "memcached"
            container_port = 11211
          }
          liveness_probe {
            tcp_socket {
              port = "memcached"
            }
            initial_delay_seconds = 30
            timeout_seconds       = 5
          }
          readiness_probe {
            tcp_socket {
              port = "memcached"
            }
            initial_delay_seconds = 30
            timeout_seconds       = 5
          }
          resources {
            requests {
              cpu    = "50m"
              memory = "96Mi"
            }
            limits {
              cpu    = "250m"
              memory = "96Mi"
            }
          }
        }
        container {
          name  = "metrics"
          image = "quay.io/prometheus/memcached-exporter:v0.6.0"
          security_context {
            run_as_user = 1001
          }
          port {
            name           = "metrics"
            container_port = 9150
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "memcached" {
  metadata {
    name      = "memcached"
    namespace = kubernetes_namespace.flux.metadata[0].name
    labels = {
      app     = "memcached"
      release = "memcached"
    }
  }
  spec {
    type = "ClusterIP"
    port {
      name        = "memcached"
      port        = 11211
      target_port = "memcached"
    }
    selector = {
      app = "memcached"
    }
  }
}

resource "kubernetes_pod_disruption_budget" "memcached" {
  metadata {
    name      = "memcached"
    namespace = kubernetes_namespace.flux.metadata[0].name
    labels = {
      app     = "memcached"
      release = "memcached"
    }
  }
  spec {
    selector {
      match_labels = {
        app     = "memcached"
        release = "memcached"
      }
    }
    min_available = 2
  }
}
