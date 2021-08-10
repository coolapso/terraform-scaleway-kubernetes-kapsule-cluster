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
  tags               = ["example", "test", "ci", "multiPool", "dev1-m"]
  enable_autoscaling = false
}

data "scaleway_k8s_cluster" "kapsule_cluster" {
  name = "test-cluster"
}

module "k8s-pool" {
  source = "/home/f0rs3ti/Devel/iac/modules/scaleway/kapsule-pool"

  kapsule_cluster_id     = data.scaleway_k8s_cluster.kapsule_cluster.id
  pool_name              = "test"
  pool_node_type         = "DEV1-M"
  pool_size              = 2
  pool_autoscaling       = local.enable_autoscaling
  pool_autohealing       = false
  pool_container_runtime = "crio"
  pool_tags              = local.tags
}
