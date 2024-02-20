
locals {
  ingress_config = {
    "ingress.hosts[0].host"              = "lptrn.v10.leasepoint.aero"
    "ingress.hosts[0].paths[0].path"     = "/"
    "ingress.hosts[0].paths[0].pathType" = "Prefix"
    "ingress.tls[0].hosts[0]"            = "lptrn.v10.leasepoint.aero"
    "ingress.tls[0].secretName"          = "aks-ingress-tls"

    "ingress.hosts[1].host"              = "aerdragon.v10.leasepoint.aero"
    "ingress.hosts[1].paths[0].path"     = "/"
    "ingress.hosts[1].paths[0].pathType" = "Prefix"
    "ingress.tls[1].hosts[0]"            = "aerdragon.v10.leasepoint.aero"
    "ingress.tls[1].secretName"          = "aks-ingress-tls"

   
  }
}