resource "kubernetes_namespace" "pihole" {
  metadata {
    annotations = {
      name = var.app_name
    }

    labels = {
      app = var.app_name
    }

    name = var.namespace
  }
}

