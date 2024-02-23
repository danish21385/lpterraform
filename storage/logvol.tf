



# resource "kubernetes_persistent_volume" "logspv" {

#   for_each = { for api in var.api_names : api => "${var.namespace}${api}-logs" }


#   metadata {
#     name = each.value
#     labels = {
#       name = each.key

#     }
#   }

#   spec {
#     capacity = {
#       storage = "1Gi"

#     }

#     access_modes       = ["ReadWriteMany"]
#     storage_class_name = "azurefile"
#     persistent_volume_source {
#       azure_file {
#         secret_name = "azure-${var.namespace}api-logs-secret"
#         share_name  = "lp-${each.key}"
#         read_only   = false
#       }
#     }
#     mount_options = [
#       "dir_mode=0777",
#       "file_mode=0777",
#       "uid=1001",
#       "gid=1001",
#       "mfsymlinks",
#       "nobrl",
#     ]

#   }
# }


# resource "kubernetes_persistent_volume_claim" "logspvc" {
#   for_each = { for api in var.api_names : api => "${var.namespace}${api}-logs" }

#   metadata {
#     name      = each.value
#     namespace = var.namespace

#   }

#   spec {
#     access_modes = ["ReadWriteMany"]
#     resources {
#       requests = {
#         storage = "1Gi"
#       }
#     }


#     selector {
#       match_labels = {
#         name = each.key
#       }
#     }
#     storage_class_name = "azurefile"
#   }
# }
