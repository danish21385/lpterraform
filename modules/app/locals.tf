
locals {
   api_ingress_host = {
    "configmap.configuration.masterdataapi" = "https://${var.api_ingress_host}/masterdata/api/"
    "configmap.configuration.coreapi"       = "https://${var.api_ingress_host}/core/api/"
    "configmap.configuration.logsapi"       = "https://${var.api_ingress_host}/logs/api/"
    "configmap.configuration.iamapi"        = "https://${var.api_ingress_host}/iam/api/"
    "configmap.configuration.gridsapi"      = "https://${var.api_ingress_host}/grids/api/"
  }
}
