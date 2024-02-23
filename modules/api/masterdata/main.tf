resource "helm_release" "apis" {
  name             = var.name
  chart            = var.helm_chart
  namespace        = var.namespace
  atomic           = var.atomic
  wait             = var.wait
  timeout          = var.timeout


values = [
    "${file("../helm/apichart/common/masterdata/lp-masterdata-common.yaml")}"
    
]


set {
  name = "image.repository"
  value = "${var.registry_server}/lp-masterdataapi"
}

set {
  name = "labels.environment"
  value = var.environment
}

set {
  name = "image.tag"
  value = var.masterdataapi_image
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
  for_each = local.ingress
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




}