resource "kubernetes_ingress" "example_ingress" {
  metadata {
    name = "${var.app_name}"
    namespace = "${var.namespace}"
  }

  spec {

    rule {
      http {
        path {
          backend {
            service_name = "${var.kubernetes_service}-tcp"
            service_port = 80
          }

          path = "/admin"
        }

        path {
          backend {
            service_name = "${var.kubernetes_service}-udp"
            service_port = 31084
          }

          path = "/"
        }
      }
    }

  }
}