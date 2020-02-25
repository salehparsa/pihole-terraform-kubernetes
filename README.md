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

## Configuring Password

For configuring the password, you need to set it in ```secret.tfvars``` file. You can easilz rename ```secret-example.tfvars``` to ```secret.tfvars```  and reuse it.

## Terraform Deployment

Validate the templates:

```
terraform plan -var-file="secret.tfvars"
```

Deploy the code:

```
terraform apply -var-file="secret.tfvars"
```
