locals {
  tags               = ["example", "test", "ci"]
  enable_autoscaling = false
}

resource "scaleway_vpc_private_network" "this" {
  name = "kapsule-pool-example"
}

module "k8s-cluster" {
  source = "../../../"

  cluster_name                = "test-cluster"
  cluster_description         = "My Test scaleway kapsule"
  cluster_version             = "1.37"
  cluster_cni                 = "calico"
  private_network_id          = scaleway_vpc_private_network.this.id
  cluster_tags                = local.tags
  delete_additional_resources = true
  auto_upgrade                = true
}


module "k8s-pool" {
  source = "github.com/4s3ti/kapsule-pool"

  kapsule_cluster_id     = module.k8s-cluster.cluster_id
  pool_name              = "test"
  pool_node_type         = "DEV1-M"
  pool_size              = 2
  pool_autoscaling       = local.enable_autoscaling
  pool_autohealing       = false
  pool_container_runtime = "crio"
  pool_tags              = local.tags

  depends_on = [module.k8s-cluster]
}
