include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../"
}

/* add inputs here to override global inputs */
inputs = {
  cluster_name                = "test-cluster"
  cluster_description         = "My Test scaleway kapsule"
  cluster_version             = "1.37"
  cluster_cni                 = "calico"
  private_network_id          = "replace-with-an-existing-private-network-id"
  delete_additional_resources = true
  auto_upgrade                = true
}
