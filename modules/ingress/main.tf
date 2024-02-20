
resource "helm_release" "application" {
  name             = var.name
  chart            = var.helm_chart
  namespace        = var.namespace
  create_namespace = var.create_namespace
  atomic           = var.atomic
  wait             = var.wait
  timeout          = var.timeout

  


  set {
    name  = "controller.replicaCount"
    value = 2
  }

  set {
    name  = "controller.image.digest"
    value = ""
  }

  set {
    name  = "controller.admissionWebhooks.patch.image.digest"
    value = ""
  }


  set {
    name  = "controller.admissionWebhooks.patch.nodeSelector\\kubernetes\\.io//os"
    value = "linux"
  }



  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/azure-load-balancer-internal"
    value = "true"
  }

  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/azure-load-balancer-health-probe-request-path"
    value = "/healthz"
  }





}