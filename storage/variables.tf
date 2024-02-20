variable "namespace" {}
variable "client_name" {}


variable "data_sa" {}
variable "data_sa_key" {}
variable "data_resource_group_name" {}
# variable "data_secret_name" {}

variable "log_sa" {}
variable "log_sa_key" {}
variable "logs_resource_group_name" {}
# variable "logs_secret_name" {}

variable "api_names" {
  type = list(string)
}