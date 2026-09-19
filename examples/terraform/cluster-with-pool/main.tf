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


resource "scaleway_k8s_pool" "this" {
  cluster_id  = module.k8s-cluster.cluster_id
  name        = "test"
  node_type   = "DEV1-M"
  size        = 2
  autoscaling = local.enable_autoscaling
  autohealing = false
  tags        = local.tags
  depends_on  = [module.k8s-cluster]
}
