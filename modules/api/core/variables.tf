variable "name" {

}

variable "helm_chart" {
  default = "../helm/apichart"
}

variable "namespace" {}
variable "environment" {}
variable "registry_server" {}
variable "coreapi_image" {}
variable "api_ingress_host" {}
variable "ingress_secret" {}
variable "volume_config" {
  type = list(object({
    volume_mount_name = string
    mount_path        = string
    volume_name       = string
    claim_name        = string

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
