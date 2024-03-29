resource "kubernetes_deployment" "flux" {
  metadata {
    name      = "flux"
    namespace = kubernetes_namespace.flux.metadata[0].name
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        name = "flux"
      }
    }
    template {
      metadata {
        labels = {
          name = "flux"
        }
      }
      spec {
        service_account_name            = kubernetes_service_account.flux.metadata[0].name
        automount_service_account_token = true
        volume {
          name = "git-key"
          secret {
            secret_name  = kubernetes_secret.flux_key.metadata[0].name
            default_mode = "0400"
            optional     = false
          }
        }
        volume {
          name = "git-keygen"
          empty_dir {
            medium = "Memory"
            size_limit = 0
          }
        }
        container {
          name              = "flux"
          image             = "docker.io/fluxcd/flux:1.20.2"
          image_pull_policy = "IfNotPresent"
          resources {
            requests = {
              cpu    = "250m"
              memory = "250M"
            }
            limits = {
              cpu    = "1000m"
              memory = "250M"
            }
          }
          port {
            container_port = 3030
          }
          liveness_probe {
            http_get {
              port = 3030
              path = "/api/flux/v6/identity.pub"
            }
            initial_delay_seconds = 5
            timeout_seconds       = 5
          }
          volume_mount {
            name       = "git-key"
            mount_path = "/etc/fluxd/ssh"
            read_only  = true
          }
          volume_mount {
            name       = "git-keygen"
            mount_path = "var/fluxd/keygen"
          }
          args = [
            "--memcached-service=",
            "--ssh-keygen-dir=/var/fluxd/keygen",
            "--git-url=git@github.com:mbellgb/infra.git",
            "--git-branch=main",
            "--git-path=k8s",
            "--git-label=flux-sync",
            "--git-user=Flux",
            "--git-email=${var.flux_email}",
            "--listen-metrics=:3031",
            "--sync-garbage-collection"
          ]
        }
      }
    }
  }
}

