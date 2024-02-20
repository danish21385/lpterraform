


# resource "kubernetes_namespace" "ns" {
#   metadata {
#     name = var.namespace
#   }
# }

module "nginx-controller" {
  source = "../modules/ingress/"
  depends_on = [


  ]

}




module "app" {
  source           = "../modules/app"
  name             = "lp-app"
  namespace        = var.namespace
  environment      = var.environment
  registry_server  = var.registry_server
  app_image        = var.app_image
  app_ingress_host = var.app_ingress_host
  api_ingress_host = var.api_ingress_host
  ingress_secret   = var.ingress_secret
  depends_on = [
    # module.tntcatlog
    module.nginx-controller
  ]
}

module "coreapi" {
  source           = "../modules/api/core"
  name             = "lp-coreapi"
  namespace        = var.namespace
  client_name      = var.client_name
  environment      = var.environment
  registry_server  = var.registry_server
  coreapi_image    = var.coreapi_image
  api_ingress_host = var.api_ingress_host
  ingress_secret   = var.ingress_secret
  depends_on = [
    # module.tntcatlog
    module.nginx-controller
  ]
}

module "masterdataapi" {
  source              = "../modules/api/masterdata"
  name                = "lp-masterdataapi"
  namespace           = var.namespace
  client_name         = var.client_name
  environment         = var.environment
  registry_server     = var.registry_server
  masterdataapi_image = var.masterdataapi_image
  api_ingress_host    = var.api_ingress_host
  ingress_secret      = var.ingress_secret
  depends_on = [
    # module.tntcatlog
  ]
}


module "iamapi" {
  source           = "../modules/api/iam"
  name             = "lp-iamapi"
  namespace        = var.namespace
  environment      = var.environment
  registry_server  = var.registry_server
  iamapi_image     = var.iamapi_image
  api_ingress_host = var.api_ingress_host
  ingress_secret   = var.ingress_secret
  depends_on = [
    #module.tntcatlog

  ]
}


module "gridsapi" {
  source           = "../modules/api/grids"
  name             = "lp-gridsapi"
  namespace        = var.namespace
  environment      = var.environment
  registry_server  = var.registry_server
  gridsapi_image   = var.gridsapi_image
  api_ingress_host = var.api_ingress_host
  ingress_secret   = var.ingress_secret
  depends_on = [
   # module.tntcatlog
  ]
}


module "logsapi" {
  source           = "../modules/api/logs"
  name             = "lp-logsapi"
  namespace        = var.namespace
  environment      = var.environment
  registry_server  = var.registry_server
  logsapi_image    = var.logsapi_image
  api_ingress_host = var.api_ingress_host
  ingress_secret   = var.ingress_secret
  depends_on = [
    #module.tntcatlog
  ]
}


module "tntcatlog" {
  source                    = "../modules/api/tntcatlog"
  name                      = "lp-tntcatlogapi"
  namespace                 = var.namespace
  environment               = var.environment
  registry_server           = var.registry_server
  tntcatlogapi_image        = var.tntcatlogapi_image
  user_assigned_identity_id = var.user_assigned_identity_id
  use_vm_managed_identity   = var.use_vm_managed_identity
  use_pod_identity          = var.use_pod_identity
  azure_resource_group      = var.azure_resource_group
  azure_subscription_id     = var.azure_subscription_id
  azure_tenant_id           = var.azure_tenant_id
  azure_keyvault_name       = var.azure_keyvault_name

}

