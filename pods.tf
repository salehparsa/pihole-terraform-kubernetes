resource "kubernetes_pod" "pihole-pod" {
  metadata {
    name = "${var.app_name}"
    labels = {
      app = "${var.app_name}"
    }
    namespace = "${var.namespace}"
  }
  spec {
      selector {
        matchLabels {
          app = "${var.app_name}"
        }
      }
      replicas = "1"
      template {
        metadata {
          labels {
            app = "${var.app_name}"
          }
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
              container_port = 443
              name = "https"
              protocol = "TCP"
          }
          port{
              container_port = 53
              name = "dns-tcp"
              protocol = "TCP"
          }
          port{
              container_port = 53
              name = "dns53"
              protocol = "UDP"
          }
          port{
              container_port = 67
              name = "dns67"
              protocol = "UDP"
          }
          env {
              name  = "Time Zone"
              value = "Europe/Berlin"
          }
          env {
              name  = "WEBPASSWORD"
              value =  "${var.password}"
          }
          env {
              name  = "Primary DNS"
              value = "${var.primary_dns}"
          }
          env {
              name  = "Secondary DNS"
              value = "${var.secondary_dns}"
          }

          }
      }
    }
  }