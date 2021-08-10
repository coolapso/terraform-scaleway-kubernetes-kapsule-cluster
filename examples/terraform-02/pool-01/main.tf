terraform {
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = "2.1.0"
    }
  }
  required_version = ">= 0.13"
}

locals {
  tags               = ["example", "test", "multiPool", "dev1-l"]
  enable_autoscaling = false
}

data "scaleway_k8s_cluster" "kapsule_cluster" {
  name = "test-cluster"
}

module "k8s-pool" {
  source = "/home/f0rs3ti/Devel/iac/modules/scaleway/kapsule-pool"

  kapsule_cluster_id     = data.scaleway_k8s_cluster.kapsule_cluster.id
  pool_name              = "pool-01"
  pool_node_type         = "DEV1-L"
  pool_size              = 1
  pool_autoscaling       = local.enable_autoscaling
  pool_autohealing       = false
  pool_container_runtime = "docker"
  pool_tags              = local.tags
}
