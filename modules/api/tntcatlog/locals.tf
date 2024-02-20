locals {
  volumes = {
    "deployment.volumes[0].name"                            = "lp-logs"
    "deployment.volumes[0].persistentVolumeClaim.claimName" = "${var.namespace}tntcatlogapi-logs"
    "deployment.volumeMounts[0].mountPath"                  = "lpusr/lpapi/Logs"
    "deployment.volumeMounts[0].name"                       = "lp-logs"

    "deployment.volumeMounts[1].name"      = "secrets-store-inline"
    "deployment.volumeMounts[1].mountPath" = "/mnt/secrets-store"
    "deployment.volumeMounts[1].readOnly"  = true


  }

  secret_provider_class = {
    "deployment.volumes[1].name"                                     = "secrets-store-inline"
    "deployment.volumes[1].csi.driver"                               = "secrets-store.csi.k8s.io"
    "deployment.volumes[1].csi.readOnly"                             = true
    "deployment.volumes[1].csi.volumeAttributes.secretProviderClass" = "lp-tntcatlogapi"

  }
  key_vault = {
    "secrets.userAssignedIdentityID" = var.user_assigned_identity_id
    "secrets.useVMManagedIdentity"   = var.use_vm_managed_identity
    "secrets.usePodIdentity"         = var.use_pod_identity
    "azure.resourceGroup"            = var.azure_resource_group
    "azure.subscriptionId"           = var.azure_subscription_id
    "azure.tenantId"                 = var.azure_tenant_id
    "azure.keyvaultName"             = var.azure_keyvault_name
  }


}
