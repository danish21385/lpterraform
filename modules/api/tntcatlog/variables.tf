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

variable "name" {
    
}

variable "helm_chart" {
  default = "../helm/apichart"
}

variable "namespace" {
  
}


variable "environment" {}  
variable "registry_server" {}

variable "tntcatlogapi_image" {}


variable "atomic" {
  default = true
}

variable "wait" {
  default = true
}

variable "timeout" {
  default = 300
}


# variable "secret_provider_class" {
#   type = map(object({
#     enabled         = bool
#     name            = string
#     secretObjects   = object({
#       type = string
#       data = map(object({
#         key        = string
#         objectName = string
#       }))
#     })
#     keyVaultSecrets = map(object({
#       objectName    = string
#       objectType    = string
#       objectVersion = string
#     }))
#   }))
# }


