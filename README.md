#  Deploy Pi-hole on Kubernetes via Terraform

It helps you to run a pod and deploy [Pi-hole](http://pi-hole.net/) on it.

### Kubernetes Config

If you have a config file in ```.kube``` folder:

```hcl
variable "config_context_auth_info" {
  description = "The Context User from ~/.kube/config"
  default     = "kubernetes-admin"
}

variable "config_context_cluster" {
  description = "The Context Cluster from ~/.kube/config"
  default     = "kubernetes"
}

```

## Terraform Deployment

Validate the templates:

```
terraform plan
```

Deploy the code:

```
terraform apply
```
