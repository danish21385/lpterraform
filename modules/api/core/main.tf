

resource "helm_release" "apis" {
  name             = var.name
  chart            = var.helm_chart
  namespace        = var.namespace
  atomic           = var.atomic
  wait             = var.wait
  timeout          = var.timeout


values = [
    "${file("../helm/apichart/common/core/lp-coreapi-common.yaml")}"
    
]


set {
  name = "image.repository"
  value = "${var.registry_server}/lp-coreapi"
}

set {
  name = "labels.environment"
  value = var.environment
}

set {
  name = "image.tag"
  value = var.coreapi_image
}

 set {
    name  = "configmap.enabled"
    value = "true"
  }

  set {
    name  = "configmap.configuration.ASPNETCORE_ENVIRONMENT"
    value = var.environment
  }

  set {
    name  = "configmap.configuration.BaseAddress"
    value = "http://lp-tntcatlogapi-service.${var.namespace}.svc.cluster.local:8080/api/accounts"
  }


dynamic "set" {
  for_each = local.logvolumes
  content {
    name = set.key
    value = set.value
  }
}



dynamic "set" {
    for_each = var.volume_config
    content {
      name  = "deployment.volumes[${set.key + 1}].name"
      value = set.value.volume_name
    }
  }

  dynamic "set" {
    for_each = var.volume_config
    content {
      name  = "deployment.volumes[${set.key + 1}].persistentVolumeClaim.claimName"
      value = set.value.claim_name
    }
  }

  dynamic "set" {
    for_each = var.volume_config
    content {
      name  = "deployment.volumeMounts[${set.key + 1}].mountPath"
      value = set.value.mount_path
    }
  }

  dynamic "set" {
    for_each = var.volume_config
    content {
      name  = "deployment.volumeMounts[${set.key + 1}].name"
      value = set.value.volume_mount_name
    }
  }



dynamic "set" {
  for_each = local.ingress
  content {
    name = set.key
    value = set.value
  }
}








#log share

# set {
#   name  = "deployment.volumes[0].name"
#   value = "${var.namespace}-logs"
# }

# set {
#   name  = "deployment.volumes[0].persistentVolumeClaim.claimName"
#   value = "${var.namespace}-coreapi-pvc"
# }

# set {
#   name  = "deployment.volumeMounts[0].mountPath"
#   value = "lpusr/lpapi/Logs"
# }

# set {
#   name  = "deployment.volumeMounts[0].name"
#   value = "${var.namespace}-logs"
# }


# #data share

# set {
#   name  = "deployment.volumes[1].name"
#   value = "${var.namespace}"
# }

# set {
#   name  = "deployment.volumes[1].persistentVolumeClaim.claimName"
#   value = "${var.namespace}"
# }

# set {
#   name  = "deployment.volumeMounts[1].mountPath"
#   value = "lpusr/lpapi/${var.namespace}"
# }

# set {
#   name  = "deployment.volumeMounts[1].name"
#   value = "${var.namespace}"
# }





# #data share

# set {
#   name  = "deployment.volumes[2].name"
#   value = "${var.namespace}-data"
# }

# set {
#   name  = "deployment.volumes[2].persistentVolumeClaim.claimName"
#   value = "${var.namespace}-data"
# }

# set {
#   name  = "deployment.volumeMounts[2].mountPath"
#   value = "lpusr/lpapi/${var.namespace}-data"
# }

# set {
#   name  = "deployment.volumeMounts[2].name"
#   value = "${var.namespace}-data"
# }

# Ingress resource

# set {
#   name  = "ingress.hosts[0].host"
#   value = var.api_ingress_host
# }

# set {
#   name  = "ingress.hosts[0].paths[0].path"
#   value = "/core(/|$)(.*)"
# }

# set {
#   name  = "ingress.hosts[0].paths[0].pathType"
#   value = "Prefix"
# }

# set {
#   name  = "ingress.tls[0].hosts[0]"
#   value = var.api_ingress_host
# }

# set {
#   name  = "ingress.tls[0].secretName"
#   value = var.ingress_secret
# }










}