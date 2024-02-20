variable "namespace" {

}
variable "client_name" {}
variable "environment" {}

variable "registry_server" {}
variable "registry_username" {}
variable "registry_password" {}



variable "app_ingress_host" {}
variable "api_ingress_host" {}
variable "ingress_secret" {}


variable "app_image" {}
variable "coreapi_image" {}
variable "gridsapi_image" {}
variable "iamapi_image" {}
variable "logsapi_image" {}
variable "masterdataapi_image" {}
variable "tntcatlogapi_image" {}


variable "user_assigned_identity_id" {

}

variable "use_vm_managed_identity" {

}

variable "use_pod_identity" {

}

variable "azure_resource_group" {

}

variable "azure_subscription_id" {

}

variable "azure_tenant_id" {

}

variable "azure_keyvault_name" {

}
