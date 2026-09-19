locals {
  tags = ["example", "test", "ci"]
}

resource "scaleway_vpc_private_network" "this" {
  name = "kapsule-autoscaler-example"
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
  enable_cluster_autoscaler   = true
}
