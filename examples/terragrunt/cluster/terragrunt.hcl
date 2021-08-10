include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../kapsule-cluster"
}

/* add inputs here to override global inputs */
inputs = {
  cluster_name                = "test-cluster"
  cluster_description         = "My Test scaleway kapsule"
  cluster_version             = "1.21"
  cluster_cni                 = "calico"
  delete_additional_resources = true
  auto_upgrade                = true
}
