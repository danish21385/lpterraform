variable "name" {
    
}

variable "helm_chart" {
  default = "../helm/apichart"
}

variable "namespace" {}
variable "environment" {}

variable "registry_server" {}

variable "gridsapi_image" {}



variable "api_ingress_host" {}

variable "ingress_secret" {}




variable "atomic" {
  default = true
}

variable "wait" {
  default = true
}

variable "timeout" {
  default = 300
}