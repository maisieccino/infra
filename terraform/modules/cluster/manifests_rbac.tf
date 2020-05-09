resource "kubernetes_service_account" "flux" {
  metadata {
    name      = "flux"
    namespace = kubernetes_namespace.flux.metadata[0].name
    labels = {
      name = "flux"
    }
  }
}

resource "kubernetes_cluster_role" "flux" {
  metadata {
    name = "flux"
    labels = {
      name = "flux"
    }
  }

  rule {
    api_groups = ["*"]
    resources  = ["*"]
    verbs      = ["*"]
  }
  rule {
    non_resource_urls = ["*"]
    verbs             = ["*"]
  }
}

resource "kubernetes_cluster_role_binding" "flux" {
  metadata {
    name = "flux"
    labels = {
      name = "flux"
    }
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "flux"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "flux"
    namespace = kubernetes_namespace.flux.metadata[0].name
  }
}
