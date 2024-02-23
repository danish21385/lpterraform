variable "namespace" {}
variable "environment" {}

#registry
variable "registry_server" {}

#ingress
variable "api_ingress_host" {}
variable "ingress_secret" {}


variable "ingress_config" {
  type = list(object({
    host       = string
    path       = string
    pathType   = string
    tls_host   = string
    tls_secret = string
  }))

}
variable "volume_config" {
  type = list(object({
    volume_mount_name = string
    mount_path        = string
    volume_name       = string
    claim_name        = string

  }))

}
variable "app_image" {}
variable "coreapi_image" {}
variable "gridsapi_image" {}
variable "iamapi_image" {}
variable "logsapi_image" {}
variable "masterdataapi_image" {}
variable "tntcatlogapi_image" {}


variable "user_assigned_identity_id" {}
variable "use_vm_managed_identity" {}
variable "use_pod_identity" {}
variable "azure_resource_group" {}
variable "azure_subscription_id" {}
variable "azure_tenant_id" {}
variable "azure_keyvault_name" {}
