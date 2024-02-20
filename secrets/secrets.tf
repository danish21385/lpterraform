


resource "kubernetes_secret_v1" "acrsecret" {
  metadata {
    name      = "acr-secret"
    namespace = var.namespace
  }

  type = "kubernetes.io/dockerconfigjson"

  data = {
    ".dockerconfigjson" = jsonencode({
      auths = {
        "${var.registry_server}" = {
          "username" = var.registry_username
          "password" = var.registry_password
          "auth"     = base64encode("${var.registry_username}:${var.registry_password}")
        }
      }
    })
  }
}


resource "kubernetes_secret" "datashare" {
  metadata {
    name      = "azure-${var.client_name}-tnt-docshare"
    namespace = var.namespace
  }

  data = {
    azurestorageaccountname = data.azurerm_storage_account.aksdata.name
    azurestorageaccountkey  = data.azurerm_storage_account.aksdata.primary_access_key
  }
}

resource "kubernetes_secret" "logshare" {
  metadata {
    name      = "azure-${var.namespace}api-logs-secret"
    namespace = var.namespace
  }

  data = {
    azurestorageaccountname = data.azurerm_storage_account.akslogs.name
    azurestorageaccountkey  = data.azurerm_storage_account.akslogs.primary_access_key
  }
}