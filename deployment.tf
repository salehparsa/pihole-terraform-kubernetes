resource "kubernetes_deployment" "pihole" {
  metadata {
    name = "${var.app_name}"
    labels = {
      app = "${var.app_name}"
    }
    namespace = "${var.namespace}"
  }

  spec {
    replicas = "${var.replicas}"
    selector {
      match_labels = {
        app = "${var.app_name}"
      }
    }
    template {
      metadata {
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
            name  = "TZ"
            value = "Europe/Berlin"
        }
        env {
            name  = "WEBPASSWORD"
            value =  "${var.password}"
        }
        env {
            name  = "DNSOne"
            value = "${var.primary_dns}"
        }
        env {
            name  = "DNSTwo"
            value = "${var.secondary_dns}"
        }
      }
     }
    }
  }
}