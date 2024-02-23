
variable "helm_chart" {
  default = "../helm/apichart"
}

variable "name" {}
variable "namespace" {}
variable "environment" {}
variable "registry_server" {}
variable "app_image" {}
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



variable "atomic" {
  default = true
}

variable "wait" {
  default = true
}

variable "timeout" {
  default = 300
}