

resource "kubernetes_persistent_volume" "data-pv" {
  


  metadata {
    name = "${var.client_name}-data"
    labels = {
      name = "${var.client_name}-data"
    }
  }

  spec {
    capacity = {
      storage = "1Gi"
    }

    access_modes       = ["ReadWriteMany"]
    storage_class_name = "azurefile"

    persistent_volume_source {
      azure_file {
        secret_name = "azure-${var.client_name}-tnt-docshare"   #var.data_secret_name
        share_name  = "${var.client_name}-data"
        read_only   = false
      }

    }
    mount_options = [
      "dir_mode=0777",
      "file_mode=0777",
      "uid=1001",
      "gid=1001",
      "mfsymlinks",
      "nobrl",
    ]


  }
}

resource "kubernetes_persistent_volume_claim" "data-pvcs" {
  


  metadata {
    name      = "${var.client_name}-data"
    namespace = var.namespace
  }

  spec {
    access_modes = ["ReadWriteMany"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }
    storage_class_name = "azurefile"
    selector {
      match_labels = {
        name = "${var.client_name}-data"
      }
    }
  }
}



resource "kubernetes_persistent_volume" "pv" {
  


  metadata {
    name = var.client_name
    labels = {
      name = var.client_name
    }
  }

  spec {
    capacity = {
      storage = "1Gi"
    }

    access_modes = ["ReadWriteMany"]

    persistent_volume_source {
      azure_file {
        secret_name = "azure-${var.client_name}-tnt-docshare"
        share_name  = var.client_name
        read_only   = false
      }

    }
    mount_options = [
      "dir_mode=0777",
      "file_mode=0777",
      "uid=1001",
      "gid=1001",
      "mfsymlinks",
      "nobrl",
    ]
    storage_class_name = "azurefile"
    # persistent_volume_reclaim_policy = "Delete"
  }
}

resource "kubernetes_persistent_volume_claim" "pvc" {
  


  metadata {
    name      = var.client_name
    namespace = var.namespace
  }

  spec {
    access_modes = ["ReadWriteMany"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }
    storage_class_name = "azurefile"
    selector {
      match_labels = {
        name = var.client_name
      }
    }
  }
}


