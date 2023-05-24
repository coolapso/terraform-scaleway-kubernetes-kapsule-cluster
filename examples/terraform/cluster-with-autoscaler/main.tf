locals {
  tags               = ["example", "test", "ci"]
  enable_autoscaling = false
}

module "k8s-cluster" {
  source = "../../../"

  cluster_name                = "test-cluster"
  cluster_description         = "My Test scaleway kapsule"
  cluster_version             = "1.27"
  cluster_cni                 = "calico"
  cluster_tags                = local.tags
  delete_additional_resources = true
  auto_upgrade                = true
  enable_cluster_autoscaler   = true 
}
