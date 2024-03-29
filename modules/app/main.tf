
resource "helm_release" "app" {
  name             = var.name
  chart            = var.helm_chart
  namespace        = var.namespace
  atomic           = var.atomic
  wait             = var.wait
  timeout          = var.timeout


values = [
    "${file("../helm/apichart/common/app/lp-app-common.yaml")}",

]

dynamic "set" {
  for_each = var.ingress_config

  content {
    name  = "ingress.hosts[${set.key}].host"
    value = set.value.host
  }
}

dynamic "set" {
  for_each = var.ingress_config

  content {
    name  = "ingress.hosts[${set.key}].paths[0].path"
    value = set.value.path
  }
}

dynamic "set" {
  for_each = var.ingress_config

  content {
    name  = "ingress.hosts[${set.key}].paths[0].pathType"
    value = set.value.pathType
  }
}

dynamic "set" {
  for_each = var.ingress_config

  content {
    name  = "ingress.tls[${set.key}].hosts[0]"
    value = set.value.tls_host
  }
}

dynamic "set" {
  for_each = var.ingress_config

  content {
    name  = "ingress.tls[${set.key}].secretName"
    value = set.value.tls_secret
  }
}


dynamic "set" {
    for_each = local.api_ingress_host
    content {
      name  = set.key
      value = set.value
    }
  }

set {
  name = "image.repository"
  value = "${var.registry_server}/lp-app"
}

set {
  name = "labels.environment"
  value = var.environment
}

set {
  name = "image.tag"
  value = var.app_image
}

 set {
    name  = "configmap.enabled"
    value = "true"
  }

  set {
    name  = "configmap.configuration.ASPNETCORE_ENVIRONMENT"
    value = var.environment
  }

#   set {
#   name  = "configmap.configuration.masterdataapi"
#   value = "https://${var.api_ingress_host}/masterdata/api/"
# }

# set {
#   name  = "configmap.configuration.coreapi"
#   value = "https://${var.api_ingress_host}/core/api/"
# }

# set {
#   name  = "configmap.configuration.logsapi"
#   value = "https://${var.api_ingress_host}/logs/api/"
# }

# set {
#   name  = "configmap.configuration.iamapi"
#   value = "https://${var.api_ingress_host}/iam/api/"
# }

# set {
#   name  = "configmap.configuration.gridsapi"
#   value = "https://${var.api_ingress_host}/grids/api/"
# }

}