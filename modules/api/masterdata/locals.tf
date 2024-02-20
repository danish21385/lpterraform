locals {
  volumes = {
    "deployment.volumes[0].name"                            = "lp-logs"
    "deployment.volumes[0].persistentVolumeClaim.claimName" = "${var.namespace}masterdataapi-logs"
    "deployment.volumeMounts[0].mountPath"                  = "lpusr/lpapi/Logs"
    "deployment.volumeMounts[0].name"                       = "lp-logs"

    "deployment.volumes[1].name"                            = "${var.client_name}"
    "deployment.volumes[1].persistentVolumeClaim.claimName" = "${var.client_name}"
    "deployment.volumeMounts[1].mountPath"                  = "lpusr/lpapi/${var.client_name}"
    "deployment.volumeMounts[1].name"                       = "${var.client_name}"

    "deployment.volumes[2].name"                            = "${var.client_name}-data"
    "deployment.volumes[2].persistentVolumeClaim.claimName" = "${var.client_name}-data"
    "deployment.volumeMounts[2].mountPath"                  = "lpusr/lpapi/${var.client_name}-data"
    "deployment.volumeMounts[2].name"                       = "${var.client_name}-data"
  }

  
  ingress = {
    "ingress.hosts[0].host"              = var.api_ingress_host
    "ingress.hosts[0].paths[0].path"     = "/masterdata(/|$)(.*)"
    "ingress.hosts[0].paths[0].pathType" = "Prefix"
    "ingress.tls[0].hosts[0]"            = var.api_ingress_host
    "ingress.tls[0].secretName"          = var.ingress_secret

  }
}
