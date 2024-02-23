locals {
  logvolumes = {
    "deployment.volumes[0].name"                            = "lp-logs"
    "deployment.volumes[0].persistentVolumeClaim.claimName" = "${var.namespace}logapi-logs"
    "deployment.volumeMounts[0].mountPath"                  = "lpusr/lpapi/Logs"
    "deployment.volumeMounts[0].name"                       = "lp-logs"

  }

  
  ingress = {
    "ingress.hosts[0].host"              = var.api_ingress_host
    "ingress.hosts[0].paths[0].path"     = "/logs(/|$)(.*)"
    "ingress.hosts[0].paths[0].pathType" = "Prefix"
    "ingress.tls[0].hosts[0]"            = var.api_ingress_host
    "ingress.tls[0].secretName"          = var.ingress_secret

  }
}
