resource "kubernetes_service" "tcp" {
  metadata {
    name = "${var.kubernetes_service}-tcp"
  }
  spec {
    selector = {
      app = "${var.app_name}"
    }
    session_affinity = "ClientIP"
    port {
      protocol    = "TCP"
      port        = 80
      target_port = 80
      name        =  "http"
    }

    type = "LoadBalancer"
  }
}


resource "kubernetes_service" "udp" {
  metadata {
    name = "${var.kubernetes_service}-udp"
  }
  spec {
    selector = {
      app = "${var.app_name}"
    }
    port {
      protocol    = "UDP"
      port        = 53
      target_port = 53
      name        =  "dns"
    }

    type = "NodePort"
  }
}