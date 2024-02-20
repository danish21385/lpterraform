

resource "helm_release" "apis" {
  name             = var.name
  chart            = var.helm_chart
  namespace        = var.namespace
  atomic           = var.atomic
  wait             = var.wait
  timeout          = var.timeout


values = [
    "${file("../helm/apichart/common/tntcatlog/lp-tntcatlog-common.yaml")}"
    
]


dynamic "set" {
  for_each = local.volumes
  content {
    name = set.key
    value = set.value
  }
}



dynamic "set" {
  for_each = local.secret_provider_class
  content {
    name = set.key
    value = set.value
  }
}


dynamic "set" {
  for_each = local.key_vault
  content {
    name = set.key
    value = set.value
  }
}




set {
  name = "image.repository"
  value = "${var.registry_server}/lp-tntcatlogapi"
}

set {
  name = "labels.environment"
  value = var.environment
}

set {
  name = "image.tag"
  value = var.tntcatlogapi_image
}

 set {
    name  = "configmap.enabled"
    value = "true"
  }

  set {
    name  = "configmap.configuration.ASPNETCORE_ENVIRONMENT"
    value = var.environment
  }

  


# Mounitng secret provider class as volume
# set {
#     name  = "deployment.volumes[1].name"
#     value = "secrets-store-inline"
#   }

#  set {
#     name  = "deployment.volumes[1].csi.driver"
#     value = "secrets-store.csi.k8s.io"
#   }

# set {
#     name  = "deployment.volumes[1].csi.readOnly"
#     value = true
#   }

#   set {
#     name  = "deployment.volumes[1].csi.volumeAttributes.secretProviderClass"
#     value = "lp-tntcatlogapi"
#   }

#   set {
#     name  = "deployment.volumeMounts[1].name"
#     value = "secrets-store-inline"
#   }

#   set {
#     name  = "deployment.volumeMounts[1].mountPath"
#     value = "/mnt/secrets-store"
#   }

#   set {
#     name  = "deployment.volumeMounts[1].readOnly"
#     value = true
#   }



#key vault config
# set {
#     name  = "secrets.userAssignedIdentityID"
#     value = var.user_assigned_identity_id
#   }

#   set {
#     name  = "secrets.useVMManagedIdentity"
#     value = var.use_vm_managed_identity
#   }

#   set {
#     name  = "secrets.usePodIdentity"
#     value = var.use_pod_identity
#   }

#   set {
#     name  = "azure.resourceGroup"
#     value = var.azure_resource_group
#   }

#   set {
#     name  = "azure.subscriptionId"
#     value = var.azure_subscription_id
#   }

#   set {
#     name  = "azure.tenantId"
#     value = var.azure_tenant_id
#   }

#   set {
#     name  = "azure.keyvaultName"
#     value = var.azure_keyvault_name
#   }


}