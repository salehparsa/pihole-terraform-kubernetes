variable "config_context_auth_info" {
  description = "The Context User from ~/.kube/config"
  default     = "kubernetes-admin"
}

variable "config_context_cluster" {
  description = "The Context Cluster from ~/.kube/config"
  default     = "kubernetes"
}

variable "kubernetes_namespace" {
  description = "Name of the Namespace"
  default     = "default"
}

variable "pod_name" {
  description = "Name of the Pod"
  default     = "pihole-pod"
}

variable "kubernetes_service" {
  description = "Name of the service"
  default     = "pihole-service"
}

variable "app_name" {
  description = "Name of the service"
  default     = "pihole"
}

variable "container_image" {
  description = "Container to Pull"
  default     = "pihole/pihole:latest"
}

variable "container_name" {
  description = "Container to Pull"
  default     = "pihole"
}
