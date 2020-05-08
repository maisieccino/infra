data "github_repository" "flux_repo" {
  full_name = "mbellgb/infra"
}

resource "tls_private_key" "flux_key" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "github_repository_deploy_key" "flux_key" {
  title = "Flux Deployment Key"
  repository = data.github_repository.flux_repo.full_name
  read_only = false
  key = tls_private_key.flux_key.public_key_openssh
}

// Flux cluster resources
resource "kubernetes_namespace" "flux" {
  metadata {
    name = "flux"
    // These annotations and labels are set to random values so that Terraform
    // can ignore them when they change.
    annotations = {
      "fluxcd.io/sync-checksum" = "ignoreme"
    }
    labels = {
      "fluxcd.io/sync-gc-mark" = "ignoreme"
    }
  }

  lifecycle {
    ignore_changes=  [
      metadata[0].annotations["fluxcd.io/sync-checksum"],
      metadata[0].labels["fluxcd.io/sync-gc-mark"]
    ]
  }
}

resource "kubernetes_secret" "flux_key" {
  metadata {
    name = "flux-git-deploy"
    namespace = "flux"
  }

  data = {
    identity = tls_private_key.flux_key.private_key_pem
  }

  type = "Opaque"
}
