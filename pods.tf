resource "kubernetes_pod" "pihole-pod" {
  metadata {
    name = "${var.app_name}"
    labels = {
      app = "${var.app_name}"
    }
  }

  spec {
        container {
          image = "${var.container_image}"
          name  = "${var.container_name}"

        port{
            container_port = 80
            name = "http"
            protocol = "TCP"
        }
        port{
            container_port = 53
            name = "dns"
            protocol = "UDP"
        }
        env {
        name  = "TZ"
        value = "Europe/Berlin"
        }

        }
  }
}